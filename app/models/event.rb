class Event < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :messages

  validates :name, :address, :team, presence: true
end
