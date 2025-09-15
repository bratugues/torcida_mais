class User < ApplicationRecord
  belongs_to :club
  has_many :attendances
  has_many :reviews, dependent: :destroy
  has_many :messages
  has_many :events
  has_one_attached :photo
  validates :location, presence: true
  validates :bar_name, :bar_address, presence: true, if: :bar?

  def average_event_rating
    reviews.average(:rating)
  end

  Cities = [
    "São Paulo",
    "Rio de Janeiro",
    "Belo Horizonte",
    "Salvador",
    "Brasília",
    "Recife",
    "Porto Alegre",
    "Curitiba",
    "Fortaleza",
    "Manaus"
  ]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
