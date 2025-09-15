class Match < ApplicationRecord
  has_many :events
  belongs_to :home_team, class_name: 'Club'
  belongs_to :away_team, class_name: 'Club'
end
