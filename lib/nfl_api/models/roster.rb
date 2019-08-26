module NFLApi
  class Roster < Base
    # {
    #     "season": 2019,
    #     "team": {
    #         "season": 2019,
    #         "teamId": "5110",
    #         "abbr": "WAS",
    #         "cityState": "Washington",
    #         "fullName": "Washington Redskins",
    #         "nick": "Redskins",
    #         "teamType": "TEAM",
    #         "conferenceAbbr": "NFC",
    #         "divisionAbbr": "NCE"
    #     },
    #     "teamPlayers": [{
    #     },

    attr_reader :season, :team, :team_players

    def initialize(season, team, team_players)
      @season = season
      @team = team
      @team_players = team_players
    end

    def self.by_team(team)
      team = Team.by_team(team)

      json_data = parse_json(endpoint(team.id))

      season = json_data["season"]
      team_players = player_array(json_data["teamPlayers"])

      new season, team, team_players
    end

    def self.season(season_number)
    end

    private

    def self.player_array(team_players_data)
      team_players_data.map do |team_player|
        Player.new(team_player)
      end
    end

    def self.endpoint(team_id)
      "http://www.nfl.com/feeds-rs/roster/#{team_id}.json"
    end

    def self.season_specific_endpoint(season_number)
    end
  end
end
