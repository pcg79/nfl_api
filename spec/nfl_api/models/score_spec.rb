require 'spec_helper'

describe NFLApi::Score do

  let(:scores_current_season_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_scores.json") }

  context ".latest" do
    it "gets the current scores for the latest week" do
      expect(NFLApi::Score).to receive(:endpoint).and_return(scores_current_season_endpoint)

      scores = described_class.latest
      game_score = score.game_score.first
      expect(scores.game_scores.count).to eq 16
      expect(scores.season).to eq 2019
      expect(scores.season_type).to eq "PRE"
      expect(scores.week).to eq 4

      expect(game_score.game.class).to eq NFLApi::Game
      expect(game_score.score) # What kind of object should score be?

    end

  end
end
