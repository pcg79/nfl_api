module NFLApi
  class Game < Base
        # {
        #     "season": 2019,
        #     "seasonType": "PRE",
        #     "week": 0,
        #     "gameId": 2019080151,
        #     "gameKey": 57835,
        #     "gameDate": "08/01/2019",
        #     "gameTimeEastern": "20:00:00",
        #     "gameTimeLocal": "20:00:00",
        #     "isoTime": 1564704000000,
        #     "homeTeamId": "0200",
        #     "visitorTeamId": "1400",
        #     "homeTeamAbbr": "ATL",
        #     "visitorTeamAbbr": "DEN",
        #     "homeDisplayName": "Atlanta Falcons",
        #     "visitorDisplayName": "Denver Broncos",
        #     "homeNickname": "Falcons",
        #     "visitorNickname": "Broncos",
        #     "gameType": "PRE",
        #     "weekNameAbbr": "HOF",
        #     "weekName": "Hall of Fame Week",
        #     "visitorTeam": {
        #         "season": 2019,
        #         "teamId": "1400",
        #         "abbr": "DEN",
        #         "cityState": "Denver",
        #         "fullName": "Denver Broncos",
        #         "nick": "Broncos",
        #         "teamType": "TEAM",
        #         "conferenceAbbr": "AFC",
        #         "divisionAbbr": "ACW"
        #     },
        #     "homeTeam": {
        #         "season": 2019,
        #         "teamId": "0200",
        #         "abbr": "ATL",
        #         "cityState": "Atlanta",
        #         "fullName": "Atlanta Falcons",
        #         "nick": "Falcons",
        #         "teamType": "TEAM",
        #         "conferenceAbbr": "NFC",
        #         "divisionAbbr": "NCS"
        #     },
        #     "site": {
        #         "siteId": 1900,
        #         "siteCity": "Canton",
        #         "siteFullname": "Tom Benson Hall of Fame Stadium",
        #         "siteState": "OH",
        #         "roofType": "OUTDOOR"
        #     },
        #     "networkChannel": "NBC"
    attr_reader :season, :season_type, :week, :game_id, :game_key, :game_date,
      :game_time_eastern, :game_time_local, :iso_time, :home_team_id, :visitor_team_id,
      :home_team_abbr, :visitor_team_abbr, :home_display_name, :visitor_display_name,
      :home_nickname, :visitor_nickname, :game_type, :week_name_abr, :week_name,
      :home_team, :visitor_team, :site, :network_channel

    def initialize(game_data)
      @season = game_data["season"]
      @season_type = game_data["seasonType"]
      @week = game_data["week"]
      @game_id = game_data["gameId"]
      @game_key = game_data["gameKey"]
      @game_date
      @game_time_eastern = game_data["gameTimeEastern"]
      @game_time_local = game_data["gameTimeLocal"]
      @iso_time = game_data["isoTime"]
      @home_team_id = game_data["homeTeamId"]
      @visitor_team_id = game_data["visitorTeamId"]

      @home_team_abbr = game_data["homeTeamAbbr"]
      @visitor_team_abbr = game_data["visitorTeamAbbr"]
      @home_display_name = game_data["homeDisplayName"]
      @visitor_display_name = game_data["visitorDisplayName"]

      @home_nickname = game_data["home_nickname"]
      @visitor_nickname = game_data["visitor_nickname"]
      @game_type = game_data["game_type"]
      @week_name_abr = game_data["week_name_abr"]
      @week_name = game_data["week_name"]

      @home_team = Team.new(game_data["homeTeam"])
      @visitor_team = Team.new(game_data["visitorTeam"])
      @site = Site.new(game_data["site"])
      @network_channel = game_data["networkChannel"]
    end
  end
end
