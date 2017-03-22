class Player < ApplicationRecord
  has_many :cup_players, dependent: :destroy
  has_many :cups, through: :cup_players, dependent: :destroy

  def cup_player(cup)
    cup_players.find_by(cup: cup)
  end

  def cup_score(cup)
    (c = cup_player(cup)).present? ? c.score : 0
  end

  def match_loose(cup)
    (c = cup_player(cup)).present? ? c.loose : 0
  end

  def match_win(cup)
    (c = cup_player(cup)).present? ? c.win : 0
  end
end
