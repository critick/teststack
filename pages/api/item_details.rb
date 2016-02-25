include RestHelper
module Pages
  module API
      class ItemDetails < AppBaseAPI

          def initialize
            @fixture      =  TestData.get_fixtures("consumer_app")
            @url          =  "/api/v1/items/"+@fixture["item_magicfridge"]
            @params       =  {
                              "app_version":      @fixture["app_version"],
                              "platform":         @fixture["platform"],
                              "session_token":    @fixture["session_token"],
                              "device_id":        @fixture["device_id"]
                              }
            super(@url, @params)
          end

      end
  end
end
