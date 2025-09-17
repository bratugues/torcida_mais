class EventsController < ApplicationController
  before_action :require_non_bar, only: [:my]

  def index
    @events = Event.includes(:club, :match)
               .where(city: current_user.location)

    if params[:query].present?
      sql_subquery = <<~SQL
        events.name ILIKE :query OR
        events.address ILIKE :query OR
        events.city ILIKE :query OR
        matches.title ILIKE :query OR
      SQL
      @events = @events.joins(:match).where(sql_subquery, query: "%#{params[:query]}%")
    end

  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new
    @attendances = @event.attendances
    @review = Review.new
    @message = Message.new
    @user_in_event = Attendance.where(event: @event, user: current_user).any?
    @user_has_attended = Attendance.where(user: current_user).exists?
  end

  def new
    @event = Event.new
     cid  = current_user.club_id

      base = Match.includes(:home_team, :away_team)
              .where("played_at >= ?", Time.zone.now)
              .order(:played_at)

      @matches_for_user = cid ? base.where("home_team_id = :cid OR away_team_id = :cid", cid: cid) : base

      @suggested_match_id = @matches_for_user.first&.id

      club_ids = @matches_for_user.flat_map { |m| [m.home_team_id, m.away_team_id] }.uniq
      @clubs_from_matches = Club.where(id: club_ids).order(:name)
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
    params.require(:event).permit(:name, :address, :city, :date, :capacity, :price, :match, :place, :club_id, :description)
  end
end
