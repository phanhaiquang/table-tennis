class ResultsController < ApplicationController
  def index
    @cup = Cup.first
    @matches = @cup.matches.order(updated_at: :desc)

    @players = Player.find(@matches.pluck(:player_1_id, :player_2_id).flatten.uniq)
    @players = @players.sort { |a,b| b.score_with_hs(@cup) <=> a.score_with_hs(@cup) }

    ids = @players.pluck(:id).sort

    @table = []
    count = ids.count + 1
    count.times { @table << [nil] * count }

    ids.each_with_index do |id, i|
      @table[0][i+1] = id
      @table[i+1][0] = id
    end

    (1..count-1).each do |r|
      id1 = @table[r][0]

      (1..count-1).each do |c|
        id2 = @table[0][c]

        if (m=Match.find_by(cup: @cup, player_1_id: id1, player_2: id2)).present?
          @table[r][c] = {score: m.score, id: m.id}
        end
      end
    end
  end
end
