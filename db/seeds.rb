Event.destroy_all
Match.destroy_all
User.destroy_all

user1 = User.create!(email: "joao123@gmail.com", password: "123123", )

match1 = Match.create!(title:"Sao Paulo x Corinthians", played_at: "Fri, 12 Sep 2025 20:00:00 UTC +00:00", team_1: "Sao Paulo", team_2: "Corinthians")

match2 = Match.create!(title:"Palmeiras x Sao Paulo", played_at: "Sun, 14 Sep 2025 16:00:00 UTC +00:00", team_1: "Palmeiras", team_2: "Sao Paulo")

match3 = Match.create!(title:"Sao Paulo x Santos", played_at: "Wed, 17 Sep 2025 21:30:00 UTC +00:00", team_1: "Sao Paulo", team_2: "Santos")

match4 = Match.create!(title:"Atletico Mineiro x Sao Paulo", played_at: "Sat, 20 Sep 2025 19:00:00 UTC +00:00", team_1: "Atletico Mineiro", team_2: "Sao Paulo")

Event.create!(
  name: "Classico Majestoso",
rail  address: "Rua das Araras 192",
  match: match1,
  user: user1,
  team: "São Paulo FC"
)

Event.create!(
  name: "Choque-Rei",
  address: "Av. Paulista 1000",
  match: match2,
  user: user1,
  team: "São Paulo FC"
)

Event.create!(
  name: "San-São",
  address: "Praça da Sé 55",
  match: match3,
  user: user1,
  team: "São Paulo FC"
)

Event.create!(
  name: "Clássico das Multidões",
  address: "Av. Independência 250",
  match: match4,
  user: user1,
  team: "São Paulo FC"
)
