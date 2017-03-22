class Match < ApplicationRecord
  belongs_to :cup
  belongs_to :player_1, class_name: Player, foreign_key: :player_1_id
  belongs_to :player_2, class_name: Player, foreign_key: :player_2_id

  after_update :update_player_score

  def name
    player_1.name + ' vs '+ player_2.name
  end

  def score
    "#{score_1.to_s} - #{score_2.to_s}"
  end

  def update_player_score
    CupPlayer.find_or_create_by(cup: self.cup, player: self.player_1).update_player_score
    CupPlayer.find_or_create_by(cup: self.cup, player: self.player_2).update_player_score
  end
end
