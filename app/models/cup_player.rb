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

  def p1_matches
    Match.where(cup_id: self.cup_id, player_1: self.player_id)
  end

  def p2_matches
    Match.where(cup_id: self.cup_id, player_2: self.player_id)
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
    score = init_score
    p1_matches.each do |match|
      score += (score_for_winner + match.star_1) if match.score_1 > match.score_2
      score += (score_for_looser - match.star_1) if match.score_1 < match.score_2
    end
    p2_matches.each do |match|
      score += (score_for_winner + match.star_2) if match.score_2 > match.score_1
      score += (score_for_looser - match.star_2) if match.score_2 < match.score_1
    end
    score
  end
end
