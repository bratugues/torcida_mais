Event.destroy_all
Match.destroy_all
User.destroy_all
Club.destroy_all

Club.create!(name: "Atlético Mineiro")
Club.create!(name: "Bahia")
Club.create!(name: "Botafogo")
Club.create!(name: "Ceará")
Club.create!(name: "Corinthians")
Club.create!(name: "Cruzeiro")
Club.create!(name: "Flamengo")
Club.create!(name: "Fluminense")
Club.create!(name: "Fortaleza")
Club.create!(name: "Grêmio")
Club.create!(name: "Internacional")
Club.create!(name: "Juventude")
Club.create!(name: "Mirassol")
Club.create!(name: "Palmeiras")
Club.create!(name: "Red Bull Bragantino")
Club.create!(name: "Santos")
Club.create!(name: "São Paulo")
Club.create!(name: "Sport")
Club.create!(name: "Vasco da Gama")
Club.create!(name: "Vitória")

partidas_proximos_20_dias = [
  # Rodada 1 — 20 e 21/set
  { home: "Palmeiras", away: "Botafogo", played_at: "2025-09-20 15:30:00" },
  { home: "Flamengo", away: "Grêmio", played_at: "2025-09-20 18:00:00" },
  { home: "Corinthians", away: "São Paulo", played_at: "2025-09-20 20:00:00" },
  { home: "Cruzeiro", away: "Atlético Mineiro", played_at: "2025-09-20 13:00:00" },
  { home: "Fluminense", away: "Vasco da Gama", played_at: "2025-09-20 11:00:00" },
  { home: "Internacional", away: "Juventude", played_at: "2025-09-21 11:00:00" },
  { home: "Bahia", away: "Vitória", played_at: "2025-09-21 13:00:00" },
  { home: "Santos", away: "Red Bull Bragantino", played_at: "2025-09-21 15:30:00" },
  { home: "Fortaleza", away: "Ceará", played_at: "2025-09-21 18:00:00" },
  { home: "Mirassol", away: "Sport", played_at: "2025-09-21 20:00:00" },

  # Rodada 2 — 24 e 25/set
  { home: "Botafogo", away: "Flamengo", played_at: "2025-09-24 20:00:00" },
  { home: "Grêmio", away: "Internacional", played_at: "2025-09-24 18:00:00" },
  { home: "São Paulo", away: "Palmeiras", played_at: "2025-09-24 15:30:00" },
  { home: "Atlético Mineiro", away: "Fluminense", played_at: "2025-09-24 13:00:00" },
  { home: "Vasco da Gama", away: "Corinthians", played_at: "2025-09-24 11:00:00" },
  { home: "Juventude", away: "Bahia", played_at: "2025-09-25 11:00:00" },
  { home: "Vitória", away: "Cruzeiro", played_at: "2025-09-25 13:00:00" },
  { home: "Red Bull Bragantino", away: "Fortaleza", played_at: "2025-09-25 15:30:00" },
  { home: "Sport", away: "Santos", played_at: "2025-09-25 18:00:00" },
  { home: "Ceará", away: "Mirassol", played_at: "2025-09-25 20:00:00" },

  # Rodada 3 — 27, 28 e 29/set
  { home: "Palmeiras", away: "Flamengo", played_at: "2025-09-27 18:00:00" },
  { home: "Corinthians", away: "Atlético Mineiro", played_at: "2025-09-27 20:00:00" },
  { home: "Fluminense", away: "São Paulo", played_at: "2025-09-27 15:30:00" },
  { home: "Botafogo", away: "Santos", played_at: "2025-09-27 13:00:00" },
  { home: "Grêmio", away: "Fortaleza", played_at: "2025-09-28 11:00:00" },
  { home: "Bahia", away: "Ceará", played_at: "2025-09-28 13:00:00" },
  { home: "Internacional", away: "Cruzeiro", played_at: "2025-09-28 15:30:00" },
  { home: "Juventude", away: "Vitória", played_at: "2025-09-28 18:00:00" },
  { home: "Red Bull Bragantino", away: "Sport", played_at: "2025-09-29 20:00:00" },
  { home: "Mirassol", away: "Vasco da Gama", played_at: "2025-09-29 19:00:00" },

  # Rodada 4 — 1 e 2/out
  { home: "Flamengo", away: "Corinthians", played_at: "2025-10-01 20:00:00" },
  { home: "Palmeiras", away: "São Paulo", played_at: "2025-10-01 18:00:00" },
  { home: "Atlético Mineiro", away: "Botafogo", played_at: "2025-10-01 15:30:00" },
  { home: "Fluminense", away: "Grêmio", played_at: "2025-10-01 13:00:00" },
  { home: "Santos", away: "Internacional", played_at: "2025-10-01 11:00:00" },
  { home: "Cruzeiro", away: "Vasco da Gama", played_at: "2025-10-02 11:00:00" },
  { home: "Bahia", away: "Fortaleza", played_at: "2025-10-02 13:00:00" },
  { home: "Juventude", away: "Ceará", played_at: "2025-10-02 15:30:00" },
  { home: "Vitória", away: "Red Bull Bragantino", played_at: "2025-10-02 18:00:00" },
  { home: "Sport", away: "Mirassol", played_at: "2025-10-02 20:00:00" },

  # Rodada 5 — 4, 5 e 6/out
  { home: "Palmeiras", away: "Corinthians", played_at: "2025-10-04 18:00:00" },
  { home: "Flamengo", away: "Fluminense", played_at: "2025-10-04 20:00:00" },
  { home: "Botafogo", away: "Mirassol", played_at: "2025-10-04 15:30:00" },
  { home: "Atlético Mineiro", away: "Cruzeiro", played_at: "2025-10-04 13:00:00" },
  { home: "São Paulo", away: "Santos", played_at: "2025-10-04 11:00:00" },
  { home: "Grêmio", away: "Bahia", played_at: "2025-10-05 11:00:00" },
  { home: "Internacional", away: "Fortaleza", played_at: "2025-10-05 13:00:00" },
  { home: "Red Bull Bragantino", away: "Juventude", played_at: "2025-10-05 15:30:00" },
  { home: "Ceará", away: "Vitória", played_at: "2025-10-05 18:00:00" },
  { home: "Sport", away: "Vasco da Gama", played_at: "2025-10-06 20:00:00" }
]

partidas_proximos_20_dias.each do |match_data|
  home_team = Club.find_by(name: match_data[:home])
  away_team = Club.find_by(name: match_data[:away])

  if home_team && away_team
    Match.create!(
      home_team: home_team,
      away_team: away_team,
      played_at: Time.parse(match_data[:played_at]),
      title: "#{home_team.name} vs #{away_team.name}"
    )
    puts "Partida criada: #{home_team.name} vs #{away_team.name} em #{match_data[:played_at]}"
  else
    puts "AVISO: Não foi possível criar '#{match_data[:home]}' vs '#{match_data[:away]}'. Time não encontrado."
  end
end

puts "✅ Partidas (próximos 20 dias) criadas com sucesso!"
