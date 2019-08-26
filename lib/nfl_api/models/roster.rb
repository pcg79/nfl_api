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

    # We need the team id to get their roster.  So theoretically if we
    # receive a team id we shouldn't need to do an extra API call to
    # get the team.  But the /roster endpoint returns an abbreviated
    # version of the Team.  So we'll just get the team from the
    # /team endpoint in both cases so we have the full team data.
    #
    def self.by_team(team_id_or_name)
      team = Team.by_team(team_id_or_name)

      json_data = parse_json(endpoint(team.id))

      season = json_data["season"]
      team_players = player_array(json_data["teamPlayers"])

      new season, team, team_players
    end

    def self.by_team_and_season(team_id_or_name, season_year)
      return nil if season_year.to_i < NFLApi::NFL_START_YEAR

      team = Team.by_team_and_season(team_id_or_name, season_year)

      json_data = parse_json(season_specific_endpoint(team.id, season_year))

      season = json_data["season"]
      team_players = player_array(json_data["teamPlayers"])

      new season, team, team_players
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

    def self.season_specific_endpoint(team_id, season_year)
      "http://www.nfl.com/feeds-rs/roster/#{team_id}/#{season_year}.json"
    end
  end
end
