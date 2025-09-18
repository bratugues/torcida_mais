class AttendancesController < ApplicationController
  before_action :set_event, only: [:create]
  before_action :require_non_bar

  def index
    @events = Event.all
    @attendances_by_event = current_user.attendances.index_by(&:event_id)
    @attendances = Attendance.where(user: current_user)
  end

  def create
    current_user.attendances.find_or_create_by!(event: @event)
    redirect_back fallback_location: events_path(@event), status: :see_other
  end

  def destroy
    attendance = current_user.attendances.find(params[:id])
    attendance.destroy
    redirect_back fallback_location: events_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
