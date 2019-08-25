require 'spec_helper'

describe NFLApi::Team do
  let(:current_season_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_teams.json") }
  let(:season_specific_endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_teams_2018.json") }

  context ".all" do
    it "returns the correct number of teams" do
      expect(described_class).to receive(:endpoint).and_return(current_season_endpoint)

      teams = 32
      pro_bowl_teams = 2
      total_teams = teams + pro_bowl_teams
      expect(described_class.all.count).to eq total_teams
    end

    it "returns the current season" do
      expect(described_class).to receive(:endpoint).and_return(current_season_endpoint)

      expect(described_class.all.first.season).to eq 2019
    end
  end

  context ".season" do
    it "returns nil if nil is passed in" do
      expect(described_class.season(nil)).to be_nil
    end

    it "returns nil if no data is received from the API" do
      expect(described_class).to receive(:parse_json).with("http://www.nfl.com/feeds-rs/teams/1938.json").and_return(nil)

      expect(described_class.season(1938)).to be_nil
    end

    it "returns the correct number of teams for a prior season" do
      expect(described_class).to receive(:season_specific_endpoint).and_return(season_specific_endpoint)

      teams = 32
      pro_bowl_teams = 2
      total_teams = teams + pro_bowl_teams
      expect(described_class.season(2018).count).to eq total_teams
    end

    it "returns the correct season for a prior season" do
      expect(described_class).to receive(:season_specific_endpoint).and_return(season_specific_endpoint)

      expect(described_class.season(2018).first.season).to eq 2018
    end
  end

  context ".by_team" do
    context "with team name" do
      it "returns the correct team" do
        expect(described_class).to receive(:endpoint).and_return(current_season_endpoint)

        expect(described_class.by_team("Washington Redskins").id).to eq 5110
      end
    end

    context "with team id" do
      it "returns the correct team" do
        expect(described_class).to receive(:endpoint).and_return(current_season_endpoint)

        expect(described_class.by_team(5110).full_name).to eq "Washington Redskins"
      end
    end
  end
end
