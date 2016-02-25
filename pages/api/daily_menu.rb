include RestHelper
module Pages
  module API
      class DailyMenu < AppBaseAPI

          def initialize
            @fixture      =  TestData.get_fixtures("consumer_app")
            @url          =  "/api/v1/daily_menu/"
            @params       =  {
                              "quick_filters":    [],
                              "place_id":         @fixture["place_id"],
                              "app_version":      @fixture["app_version"],
                              "platform":         @fixture["platform"],
                              "locality_id":      @fixture["locality_id"],
                              "session_token":    @fixture["session_token"],
                              "device_id":        @fixture["device_id"]
                              }
            super(@url, @params)
          end

      end
  end
end
