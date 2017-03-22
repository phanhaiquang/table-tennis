require 'rails_helper'

describe Match do
  let(:cup) { create :cup }
  let(:player_1) { create :player }
  let(:player_2) { create :player }
  let(:player_3) { create :player }
  let(:match_1) { create :match, cup: cup, player_1: player_1, player_2: player_2 }
  let(:match_2) { create :match, cup: cup, player_1: player_1, player_2: player_3 }

  context 'Associations' do
    it { should belong_to :cup }
    it { should belong_to :player_1 }
    it { should belong_to :player_2 }
  end

  context 'match default score' do
    it {
      expect(match_1.score_1).to eq 0
      expect(match_1.score_2).to eq 0
      expect(match_2.score_1).to eq 0
      expect(match_2.score_2).to eq 0
    }
  end

  context 'match update' do
    before { match_1.update_attributes(score_1: 3, score_2: 1) }
    it {
      expect(player_1.cups.count).to eq 1
      expect(player_1.cup_score(cup)).to eq 1
      expect(player_1.match_win(cup)).to eq 1
      expect(player_1.match_loose(cup)).to eq 0

      expect(player_2.cups.count).to eq 1
      expect(player_2.cup_score(cup)).to eq 0
      expect(player_2.match_win(cup)).to eq 0
      expect(player_2.match_loose(cup)).to eq 1

      expect(player_3.cups.count).to eq 0
      expect(player_3.cup_score(cup)).to eq 0
      expect(player_3.match_win(cup)).to eq 0
      expect(player_3.match_loose(cup)).to eq 0
    }

    context 'another match updated' do
      before { match_2.update_attributes(score_1: 2, score_2: 3) }
      it 'related users updated' do
        expect(player_2.cups.count).to eq 1
        expect(player_2.cup_score(cup)).to eq 0
        expect(player_2.match_win(cup)).to eq 0
        expect(player_2.match_loose(cup)).to eq 1

        expect(player_1.cups.count).to eq 1
        expect(player_1.cup_score(cup)).to eq 1
        expect(player_1.match_win(cup)).to eq 1
        expect(player_1.match_loose(cup)).to eq 1

        expect(player_3.cups.count).to eq 1
        expect(player_3.cup_score(cup)).to eq 1
        expect(player_3.match_win(cup)).to eq 1
        expect(player_3.match_loose(cup)).to eq 0

        # somehow user updates wrong result, so that he re-input the result
        match_2.update_attributes(score_1: 3, score_2: 0)
        expect(player_2.cups.count).to eq 1
        expect(player_2.cup_score(cup)).to eq 0
        expect(player_2.match_win(cup)).to eq 0
        expect(player_2.match_loose(cup)).to eq 1

        expect(player_1.cups.count).to eq 1
        expect(player_1.cup_score(cup)).to eq 2
        expect(player_1.match_win(cup)).to eq 2
        expect(player_1.match_loose(cup)).to eq 0

        expect(player_3.cups.count).to eq 1
        expect(player_3.cup_score(cup)).to eq 0
        expect(player_3.match_win(cup)).to eq 0
        expect(player_3.match_loose(cup)).to eq 1
      end
    end
  end
end
