class Club < ApplicationRecord
  has_many :users
  has_many :events

  validates :name, presence: true

  def shield_path
    "escudos/#{name.parameterize}.png"
  end
end
