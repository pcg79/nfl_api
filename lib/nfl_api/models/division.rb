module NFLApi
  class Division
    # "division":{"id":"0018",
      # "abbr":"NCW",
      # "fullName":"NFC West Division"},

    attr_reader :id, :abbr, :full_name

    def initialize(params)
      @id = params["id"]
      @abbr = params["abbr"]
      @full_name = params["fullName"]
    end
  end
end
