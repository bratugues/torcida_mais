class EventsController < ApplicationController

  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new
  end
end
