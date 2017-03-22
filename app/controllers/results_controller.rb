class ResultsController < ApplicationController
  def index
    @cup = Cup.first
    @matches = @cup.matches
    @players = Player.find(@matches.pluck(:player_1_id, :player_2_id).flatten.uniq)
  end
end
