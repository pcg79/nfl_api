module NFLApi
  class Team < Base
    # {"season":2019,
    # "teamId":"3800",
    # "abbr":"ARI",
    # "cityState":"Arizona",
    # "fullName":"Arizona Cardinals",
    # "nick":"Cardinals",
    # "teamType":"TEAM",
    # "conferenceAbbr":"NFC",
    # "divisionAbbr":"NCW",
    # "conference":{"id":"0015",
      # "abbr":"NFC",
      # "fullName":"National Football Conference"},
    # "division":{"id":"0018",
      # "abbr":"NCW",
      # "fullName":"NFC West Division"},
    # "yearFound":1920,
    # "stadiumName":"State Farm Stadium",
    # "ticketPhoneNumber":"602-379-0102",
    # "teamSiteUrl":"http://www.azcardinals.com/",
    # "teamSiteTicketUrl":"http://www.azcardinals.com/tickets/"},

    attr_reader :season, :id, :abbr, :city_state, :full_name,
      :nick, :team_type, :conference_abbr, :division_abbr, :conference,
      :division, :year_found, :stadium_name, :ticket_phone_number,
      :team_site_url, :team_site_ticket_url


    def initialize(params)
      @season = params["season"]
      @id = params["team_id"]

      @abbr = params["abbr"]
      @city_state = params["cityState"]
      @full_name = params["fullName"]
      @nick = params["nick"]
      @team_type = params["teamType"]

      @conference_abbr = params["conferenceAbbr"]
      @division_abbr = params["divisionAbbr"]

      set_conference(params["conference"])
      set_division(params["division"])

      @year_found = params["yearFound"]
      @stadium_name = params["stadiumName"]

      @ticket_phone_number = params["ticketPhoneNumber"]
      @team_site_url = params["teamSiteUrl"]
      @team_site_ticket_url = params["teamSiteTicketUrl"]
    end

    def self.all
      teams = parse_json(endpoint)["teams"]

      teams.map do |team_data|
        Team.new(team_data)
      end
    end

    def self.season(season_number)
      return nil unless season_number

      teams = parse_json(season_specific_endpoint(season_number))["teams"]

      teams.map do |team_data|
        Team.new(team_data)
      end
    end

    private

    def set_conference(conference_params)
      conference_id = conference_params["id"]
      if Team.conferences[conference_id]
        @conference = Team.conferences[conference_id]
      else
        @conference = Conference.new(conference_params)
      end
      Team.conferences[conference_id] = @conference
    end

    def set_division(division_params)
      if division_params
        division_id = division_params["id"]
        if Team.divisions[division_id]
          @division = Team.divisions[division_id]
        else
          @division = Division.new(division_params)
        end
      end
      Team.divisions[division_id] = @division
    end

    def self.conferences
      @conferences ||= {}
    end

    def self.divisions
      @divisions ||= {}
    end

    def self.endpoint
      "http://www.nfl.com/feeds-rs/teams.json"
    end

    def season_specific_endpoint(season_number)
      "http://www.nfl.com/feeds-rs/teams/#{season_number}.json"
    end
  end
end
