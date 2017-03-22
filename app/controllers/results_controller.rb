class ResultsController < ApplicationController
  def index
    @cup = Cup.first
    @matches = @cup.matches.order(updated_at: :desc)
    @players = Player.find(@matches.pluck(:player_1_id, :player_2_id).flatten.uniq)

    @table = []
    count = @players.count + 1
    count.times { @table << [nil] * count }
    @players.each_with_index do |p1, r|
      @table[r+1][0] = p1.name
      @players.each_with_index do |p2, c|
        @table[0][c+1] = p2.name
        if m=Match.find_by(cup: @cup, player_1: p1, player_2: p2)
          @table[r+1][c+1] = m.score
        else
          @table[r+1][c=1] = nil
        end
      end
    end
  end
end
