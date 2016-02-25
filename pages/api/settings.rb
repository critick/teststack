include RestHelper
module Pages
  module API
      class Settings < BaseAPI
        @status_code = ""

          def get_status_code
            @status_code
          end

          def get_settings
              app_version = "3.6.8"
                if @platform=="ANDROID"
                  app_version = "3.6.8"
                else
                  app_version = "1.8.1"
                end
              body = {
                        "app_version" => app_version,
                        "platform" => @platform,
                        "device_id":"285c3ff52aa28296"
                      }
              response = make_get_request "/user/api/v1/settings",
              body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

      end
  end
end
