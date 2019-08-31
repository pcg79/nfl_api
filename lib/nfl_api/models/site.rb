module NFLApi
  class Site < Base
    #     "site": {
    #         "siteId": 1900,
    #         "siteCity": "Canton",
    #         "siteFullname": "Tom Benson Hall of Fame Stadium",
    #         "siteState": "OH",
    #         "roofType": "OUTDOOR"

    attr_reader :site_id, :site_city, :site_fullname, :site_state,
      :roof_type

    def initialize(site_data)
      @site_id = site_data["siteId"]
      @site_city = site_data["siteCity"]
      @site_fullname = site_data["siteFullname"]
      @site_state = site_data["siteState"]
      @roof_type = site_data["roofType"]
    end
  end
end
