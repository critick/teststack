include RestHelper

module Pages
  module API
      class GetAddress < AppBaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("consumer_app")
            @url      =  "/user/api/v1/addresses"
            @params   =  {
                           "app_version":   @fixture["app_version"],
                           "platform":      @fixture["platform"],
                           "session_token": @fixture["session_token"],
                           "device_id":     @fixture["device_id"]
                         }
            super(@url, @params)
        end



      end
  end
end
