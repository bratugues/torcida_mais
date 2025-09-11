class Event < ApplicationRecord
  belongs_to :user
  belongs_to :match
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :name, :address, :team, :description, :date, presence: true

  def average_rating
    reviews.average(:rating)
  end
end
