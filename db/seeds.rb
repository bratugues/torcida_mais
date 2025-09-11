Event.destroy_all
Match.destroy_all
User.destroy_all

user1 = User.create!(email: "joao123@gmail.com", password: "123123", )

Match.create!(title:"Fluminense x Corinthians", played_at: "Sat, 13 Sep 2025 21:00:00 UTC +00:00", team_1: "Fluminense", team_2: "Corinthians")
Match.create!(title:"Grêmio x Mirassol", played_at: "Sat, 13 Sep 2025 16:00:00 UTC +00:00", team_1: "Grêmio", team_2: "Mirassol")
Match.create!(title:"Fortaleza x Vitória", played_at: "Sat, 13 Sep 2025 16:00:00 UTC +00:00", team_1: "Fortaleza", team_2: "Vitória")
Match.create!(title:"Palmeiras x Internacional", played_at: "Sat, 13 Sep 2025 18:30:00 UTC +00:00", team_1: "Palmeiras", team_2: "Internacional")
Match.create!(title:"Bragantino x Sport", played_at: "Sun, 14 Sep 2025 11:00:00 UTC +00:00", team_1: "Bragantino", team_2: "Sport")
Match.create!(title:"Atlético-MG x Santos", played_at: "Sun, 14 Sep 2025 16:00:00 UTC +00:00", team_1: "Atlético-MG", team_2: "Santos")
Match.create!(title:"Juventude x Flamengo", played_at: "Sun, 14 Sep 2025 16:00:00 UTC +00:00", team_1: "Juventude", team_2: "Flamengo")
Match.create!(title:"São Paulo x Botafogo", played_at: "Sun, 14 Sep 2025 17:30:00 UTC +00:00", team_1: "São Paulo", team_2: "Botafogo")
Match.create!(title:"Vasco x Ceará", played_at: "Sun, 14 Sep 2025 20:30:00 UTC +00:00", team_1: "Vasco", team_2: "Ceará")
Match.create!(title:"Bahia x Cruzeiro", played_at: "Mon, 15 Sep 2025 20:00:00 UTC +00:00", team_1: "Bahia", team_2: "Cruzeiro")
