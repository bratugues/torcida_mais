class AttendancesController < ApplicationController
  before_action :set_event, only: [:create]

  def index
    @attendances = current_user.attendances
  end

  def create
    @attendance = Attendance.new
    @attendance.event = @event
    @attendance.user = current_user
    @attendance.save!
    redirect_to attendances_path
  end

  def destroy
    @attendance = Attendance.find(params[:id])
    @attendance.destroy
    redirect_to attendances_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
