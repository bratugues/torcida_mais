class Event < ApplicationRecord
  belongs_to :user
  belongs_to :match
  belongs_to :club
  has_many :reviews, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :attendances, dependent: :destroy

  validates :name, :address, :club, :description, :date, :place, presence: true
  validates :city, presence: true, inclusion: { in: User::Cities }

  def average_rating
    reviews.average(:rating)
  end
end
