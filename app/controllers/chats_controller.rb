class ChatsController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @message = Message.new
  end
end
