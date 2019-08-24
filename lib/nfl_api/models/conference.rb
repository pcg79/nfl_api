module NFLApi
  class Conference
    # "conference":{"id":"0015",
      # "abbr":"NFC",
      # "fullName":"National Football Conference"},

    attr_reader :id, :abbr, :full_name

    def initialize(params)
      @id = params["id"]
      @abbr = params["abbr"]
      @full_name = params["fullName"]
    end
  end
end
