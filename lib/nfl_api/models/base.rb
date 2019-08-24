require 'open-uri'
require 'json'

module NFLApi
  class Base

    def self.parse_json(endpoint)
      JSON.load(open(endpoint))
    end
  end
end
