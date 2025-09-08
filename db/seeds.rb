# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Match.create!(title:"Sao Paulo x Corinthians", played_at: "Fri, 12 Sep 2025 20:00:00 UTC +00:00", team_1: "Sao Paulo", team_2: "Corinthians")

Match.create!(title:"Palmeiras x Sao Paulo", played_at: "Sun, 14 Sep 2025 16:00:00 UTC +00:00", team_1: "Palmeiras", team_2: "Sao Paulo")

Match.create!(title:"Sao Paulo x Santos", played_at: "Wed, 17 Sep 2025 21:30:00 UTC +00:00", team_1: "Sao Paulo", team_2: "Santos")

Match.create!(title:"Atletico Mineiro x Sao Paulo", played_at: "Sat, 20 Sep 2025 19:00:00 UTC +00:00", team_1: "Atletico Mineiro", team_2: "Sao Paulo")
