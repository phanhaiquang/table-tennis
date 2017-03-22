Cup.create!([
  {name: "Mar - 2017", active: true}
]) if Cup.count == 0

Player.create!([
  {name: "Bao Tran"},
  {name: "Tuan Pham"},
  {name: "Hung Vo"},
  {name: "Nguyen Ton"},
  {name: "Anh Nguyen"},
  {name: "Quang Phan"}
]) if Player.count == 0

cup = Cup.first

Player.all.each do |player|
  CupPlayer.create!(cup: cup, player: player)
end if CupPlayer.count == 0

Player.all.each do |player_1|
  Player.all.each do |player_2|
    next if player_1.id <= player_2.id
    Match.create(cup: cup, player_1: player_1, player_2: player_2, score_1: 0, score_2: 0)
  end
end if Match.count == 0
