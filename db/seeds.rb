Event.destroy_all
Match.destroy_all
User.destroy_all


rodada_brasileirao = [
  { home: "Fluminense",    away: "Corinthians",   played_at: "2025-09-13 18:00:00" },
  { home: "Grêmio",        away: "Mirassol",      played_at: "2025-09-13 13:00:00" },
  { home: "Fortaleza",     away: "Vitória",       played_at: "2025-09-13 13:00:00" },
  { home: "Palmeiras",     away: "Internacional", played_at: "2025-09-13 15:30:00" },
  { home: "Red Bull Bragantino",    away: "Sport",         played_at: "2025-09-14 08:00:00" },
  { home: "Atlético Mineiro",   away: "Santos",        played_at: "2025-09-14 13:00:00" },
  { home: "Juventude",     away: "Flamengo",      played_at: "2025-09-14 13:00:00" },
  { home: "São Paulo",     away: "Botafogo",      played_at: "2025-09-14 14:30:00" },
  { home: "Vasco da Gama",         away: "Ceará",         played_at: "2025-09-14 17:30:00" },
  { home: "Bahia",         away: "Cruzeiro",      played_at: "2025-09-15 17:00:00" }
]


rodada_brasileirao.each do |match_data|
  home_team = Club.find_by(name: match_data[:home])
  away_team = Club.find_by(name: match_data[:away])
  if home_team && away_team
    # 3. Criar a partida usando os objetos que encontramos
    Match.create!(
      home_team: home_team,
      away_team: away_team,
      played_at: Time.parse(match_data[:played_at]),
      title: "#{home_team.name} vs #{away_team.name}"
    )
    puts "Partida criada: #{home_team.name} vs #{away_team.name}"
  else
    puts "AVISO: Não foi possível criar a partida '#{match_data[:home]}' vs '#{match_data[:away]}'. Um dos times não foi encontrado."
  end
end

puts "✅ Partidas da rodada criadas com sucesso!"
