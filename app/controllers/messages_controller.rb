class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.event = @event
    if @message.save
      redirect_to event_chats_path(@event)
    else
      render "events/show", status: :unprocessable_entity
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
