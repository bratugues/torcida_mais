class EventsController < ApplicationController
  before_action :require_non_bar, only: [:my]

  def index
    @events = Event.includes(:club, :match)
               .where("events.address ILIKE ?", "%#{current_user.location}%")

    if params[:query].present?
      sql_subquery = <<~SQL
        events.name ILIKE :query OR
        events.address ILIKE :query OR
        matches.title ILIKE :query
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
    params.require(:event).permit(:name, :address, :date, :capacity, :price, :match, :club_id, :description)
  end
end
