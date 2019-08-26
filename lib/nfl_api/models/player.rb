module NFLApi
  class Player < Base
    #         "season": 2019,
    #         "nflId": 2562817,
    #         "status": "ACT",
    #         "displayName": "B.J. Blunt",
    #         "firstName": "B.J.",
    #         "lastName": "Blunt",
    #         "esbId": "BLU745149",
    #         "gsisId": "00-0034923",
    #         "birthDate": "04/21/1995",
    #         "homeTown": "",
    #         "collegeId": 6403,
    #         "collegeName": "McNeese State",
    #         "positionGroup": "LB",
    #         "position": "LB",
    #         "jerseyNumber": 48,
    #         "height": "6-1",
    #         "weight": 220,
    #         "yearsOfExperience": 0,
    #         "teamAbbr": "WAS",
    #         "teamSeq": 1,
    #         "teamId": "5110",
    #         "teamFullName": "Washington Redskins"

    attr_reader :season, :nfl_id, :status, :display_name,
      :first_name, :last_name, :esb_id, :gsis_id, :birth_date,
      :home_town, :college_id, :college_name, :position_group,
      :position, :jersey_number, :height, :weight,
      :years_of_experience, :team_abbr, :team_seq, :team_id,
      :team_full_name

    def initialize(params)
      @season = params["season"]
      @nfl_id = params["nflId"]
      @status = params["status"]
      @display_name = params["displayName"]
      @first_name = params["firstName"]
      @last_name = params["lastName"]
      @esb_id = params["esbId"]
      @gsis_id = params["gsisId"]
      @birth_date = params["birthDate"]
      @home_town = params["homeTown"]
      @college_id = params["collegeId"]
      @college_name = params["collegeName"]
      @position_group = params["positionGroup"]
      @position = params["position"]
      @jersey_number = params["jerseyNumber"]
      @height = params["height"]
      @weight = params["weight"]
      @years_of_experience = params["yearsOfExperience"]
      @team_abbr = params["teamAbbr"]
      @team_seq = params["teamSeq"]
      @team_id = params["teamId"]
      @team_full_name = params["teamFullName"]
    end
  end
end
