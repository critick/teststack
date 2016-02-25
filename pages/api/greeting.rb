include RestHelper
module Pages
  module API
      class Greeting < AppBaseAPI

          def initialize
            @fixture      =  TestData.get_fixtures("consumer_app")
            @url          =  "/api/v1/greeting"
            @params       =  {
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
