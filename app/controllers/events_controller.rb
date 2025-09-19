class EventsController < ApplicationController
  before_action :require_non_bar, only: [:my]
  before_action :set_form_collections, only: [:new, :create]

  def index

    if params[:match_id].present?
      # Se um match_id foi passado na URL, use-o como filtro inicial
      @events = Event.includes(:club, :match).where(match_id: params[:match_id], city: current_user.location)
    else
      # Se não, use o filtro padrão por localização do usuário
      @events = Event.includes(:club, :match).where(city: current_user.location, club: current_user.club)
    end

    if params[:query].present?
      sql_subquery = <<~SQL
      events.name ILIKE :query OR
      events.address ILIKE :query OR
      events.city ILIKE :query OR
      matches.title ILIKE :query OR
      events.place ILIKE :query
      SQL
      @events = @events.joins(:match).where(sql_subquery, query: "%#{params[:query]}%")
    end

    @attendances_by_event = current_user.attendances.index_by(&:event_id)
    @events = @events.order(created_at: :desc)
  end

  def show
    @event = Event.find(params[:id])
    @attendance = current_user.attendances.find_by(event: @event) || Attendance.new
    @user_in_event = @attendance.persisted?
    @match_event = Event.includes(:club, :match)
    @attendances = @event.attendances
    @review = Review.new
    @message = Message.new
    @user_has_attended = current_user.attendances.exists?
    @reviews = @event.reviews
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.match = Match.find(params[:event][:match_id])
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: "Event created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice: "Successfully update"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path, status: :see_other
  end

  def my
    @events = current_user.events
  end

  private

  def event_params
    params.require(:event).permit(:name, :address, :city, :date, :capacity, :price, :match, :match_id, :place, :club_id, :description)
  end

  def set_form_collections
    cid = current_user.club_id

    base = Match.includes(:home_team, :away_team)
            .where("played_at >= ?", Time.zone.now)
            .order(:played_at)

    @matches_for_user = cid ? base.where("home_team_id = :cid OR away_team_id = :cid", cid: cid) : base

    @suggested_match_id = @matches_for_user.first&.id

    club_ids = @matches_for_user.flat_map { |m| [m.home_team_id, m.away_team_id] }.uniq
    @clubs_from_matches = Club.where(id: club_ids).order(:name)
  end
end
