class MessagesController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @message = Message.new(message_params)
    @message.user = current_user
    @message.event = @event
    if @message.save
      render turbo_stream: turbo_stream.replace("new_message", partial: "chats/form", locals: {event: @event, message: Message.new})
    else
      render turbo_stream: turbo_stream.replace("new_message", partial: "chats/form", locals: {event: @event, message: @message})
    end
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
