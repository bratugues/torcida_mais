class Club < ApplicationRecord
  has_many :users
  has_many :events
  has_many :home_matches, class_name: 'Match', foreign_key: 'home_team_id'
  has_many :away_matches, class_name: 'Match', foreign_key: 'away_team_id'

  validates :name, presence: true

  def hero_path
    "torcidas/torcida_#{name.to_s.parameterize}.png"
  end

  def shield_path
    "escudos/#{name.parameterize}.png"
  end

  def banner_path
    "event-bg/#{name.parameterize}-banner.png"
  end
end
