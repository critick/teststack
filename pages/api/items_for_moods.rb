include RestHelper
module Pages
  module API
      class ItemForMoods < AppBaseAPI

          def initialize
            @fixture      =  TestData.get_fixtures("consumer_app")
            @url          =  "/api/v1/items/"
            @params       =  {
                              "app_version":      @fixture["app_version"],
                              "platform":         @fixture["platform"],
                              "session_token":    @fixture["session_token"],
                              "device_id":        @fixture["device_id"],
                              "locality_id":      @fixture["locality_id"],
                              "place_id":         @fixture["place_id"]
                              }
            super(@url, @params)
          end

      end
  end
end
