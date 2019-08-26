require 'spec_helper'

describe NFLApi::Roster do

  let(:teams_current_season_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_teams.json") }
  let(:roster_current_season_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_roster_redskins_2019.json") }

  context ".by_team" do
    it "gets the current season roster by team name" do
      expect(NFLApi::Team).to receive(:endpoint).and_return(teams_current_season_endpoint)
      expect(NFLApi::Roster).to receive(:endpoint).and_return(roster_current_season_endpoint)

      roster = described_class.by_team("Washington Redskins")
      expect(roster.season).to eq 2019
      expect(roster.team.id).to eq 5110
      expect(roster.team_players.count).to be > 1
      expect(roster.team_players.first.nfl_id).not_to be_nil
    end

    it "gets the current season roster by team id" do
      expect(NFLApi::Team).to receive(:endpoint).and_return(teams_current_season_endpoint)
      expect(NFLApi::Roster).to receive(:endpoint).and_return(roster_current_season_endpoint)

      roster = described_class.by_team(5110)
      expect(roster.season).to eq 2019
      expect(roster.team.full_name).to eq "Washington Redskins"
      expect(roster.team_players.count).to be > 1
    end
  end

  context ".by_team_and_season" do
    it "gets the correct season's roster by team name" do
    end

    it "gets the correct season's roster by team id" do
    end
  end
end
