class Event < ApplicationRecord
  belongs_to :user
  belongs_to :match

  validates :name, :address, :team, presence: true
end
