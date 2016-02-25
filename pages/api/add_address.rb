include RestHelper
module Pages
  module API
      class AddAddress < AppBaseAPI

          def initialize
            @fixture      =  TestData.get_fixtures("consumer_app")
            @url          =  "/user/api/v1/addresses"

            @params       =  {
                              "app_version":      @fixture["app_version"],
                              "platform":         @fixture["platform"],
                              "address_details":  @fixture["address_details"],
                              "locality_name":    @fixture["locality_name"],
                              "locality_id":      @fixture["locality_id"],
                              "longitude":        @fixture["longitude"],
                              "latitude":         @fixture["latitude"],
                              "landmark":         @fixture["landmark"],
                              "session_token":    @fixture["session_token"],
                              "device_id":        @fixture["device_id"]
                              }

            super(@url, @params)
          end

      end
  end
end
