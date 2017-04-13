class CupPlayer < ApplicationRecord
  INIT_SCORE = 10

  belongs_to :cup
  belongs_to :player

  def update_player_score
    w, l = 0, 0
    Match.where(cup: self.cup, player_1: self.player).each do |match|
      w += 1 if match.score_1 > match.score_2
      l += 1 if match.score_1 < match.score_2
    end
    Match.where(cup: self.cup, player_2: self.player).each do |match|
      w += 1 if match.score_2 > match.score_1
      l += 1 if match.score_2 < match.score_1
    end
    self.update_attributes(win: w, loose: l)
  end

  def score_for_winner
    1
  end

  def score_for_looser
    -1
  end

  def init_score
    INIT_SCORE
  end

  def score
    init_score + win * score_for_winner + loose * score_for_looser
  end
end
