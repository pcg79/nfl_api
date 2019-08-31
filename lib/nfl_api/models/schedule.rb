module NFLApi
  class Schedule < Base
    attr_reader :season, :game_schedules

    def initialize(game_schedules_data, season)
      @game_schedules = parse_games(game_schedules_data)
      @season = season
    end

    def self.all
      schedule_data = parse_json(endpoint)

      new schedule_data["gameSchedules"], schedule_data["season"]
    end

    private

    def parse_games(game_schedules_data)
      game_schedules_data.map do |game_data|
        NFLApi::Game.new game_data
      end
    end

    def self.endpoint
      "http://www.nfl.com/feeds-rs/schedules.json"
    end
  end
end
