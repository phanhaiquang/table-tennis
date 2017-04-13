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

  def hs(cup)
    (Match.where(cup: cup, player_1: self).pluck(:score_1).sum + Match.where(cup: cup, player_2: self).pluck(:score_2).sum) -
    (Match.where(cup: cup, player_1: self).pluck(:score_2).sum + Match.where(cup: cup, player_2: self).pluck(:score_1).sum)
  end

  def signed_hs(cup)
    hs(cup) > 0 ? "+#{hs}" : hs.to_s
  end

  def score_with_hs(cup)
    cup_score(cup) * 1000 + hs(cup)
  end
end
