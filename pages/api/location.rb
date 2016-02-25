include RestHelper

module Pages
  module API
      class Location < AppBaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("consumer_app")
            @url      =  "/location/api/v1/google_places/custom_autocomplete"
            @params   =  {
                           "app_version":   @fixture["app_version"],
                           "platform":      @fixture["platform"],
                           "session_token": @fixture["session_token"],
                           "device_id":     @fixture["device_id"],
                         }
            super(@url, @params)
        end

        def set_query(query_text)
            @params.merge!(input: query_text)
        end

      end
  end
end
