class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :rating, :title, :content, presence: true
end
