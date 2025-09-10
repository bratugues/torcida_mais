class Event < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :reviews, dependent: :destroy
  validates :name, :address, :team, presence: true
end
