class Message < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :content, presence: true

  after_create_commit :broadcast_append_to_chat

  private

  def broadcast_append_to_chat
    broadcast_append_to event, target: "messages", partial: "chats/message", locals: { message: self }
  end
end
