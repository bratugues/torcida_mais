class User < ApplicationRecord
  has_many :attendances
  has_many :reviews, dependent: :destroy
  has_many :messages
  has_many :events

  def average_event_rating
    reviews.average(:rating)
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
