require 'spec_helper'

describe NFLApi::Team do
  let(:endpoint) { File.join(File.dirname(__FILE__), "..", "..", "fixtures", "nfl_teams.json") }

  context ".all" do
    it "returns the correct number of teams" do
      expect(described_class).to receive(:endpoint).and_return(endpoint)
      expect(NFLApi::Conference).to receive(:new).twice.and_call_original
      expect(NFLApi::Division).to receive(:new).exactly(8).times.and_call_original

      teams = 32
      pro_bowl_teams = 2
      total_teams = teams + pro_bowl_teams
      expect(NFLApi::Team.all.count).to eq total_teams
    end
  end
end
