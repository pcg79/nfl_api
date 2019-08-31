require 'spec_helper'

describe NFLApi::Schedule do

  let(:schedule_current_season_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_schedules.json") }

  context ".all" do
    it "gets the current schedule for the current season" do
      expect(NFLApi::Schedule).to receive(:endpoint).and_return(schedule_current_season_endpoint)

      schedule = described_class.all
      game = schedule.game_schedules.first
      expect(schedule.season).to eq 2019

      # Each team plays 20 games (4 preseason, 16 regular season). 2 teams play 1 extra game (the
      # Hall of Fame game).  So `(32 * 20) / 2 + 1 = 321`
      expect(schedule.game_schedules.count).to eq 321
      expect(game.class).to eq NFLApi::Game
      expect(game.home_team.class).to eq NFLApi::Team
      expect(game.site.class).to eq NFLApi::Site
    end
  end

end
