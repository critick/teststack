include RestHelper
module Pages
  module API
      class Referral < BaseAPI

        @status_code   = ""
        @response_data = ""

          def get_status_code
            @status_code
          end

          def request_referral_details
              app_version = "3.6.8"
                if @platform=="ANDROID"
                  app_version = "3.6.8"
                else
                  app_version = "1.8.1"
                end
              body = {
                        "app_version" => app_version,
                        "platform" => @platform,
                        "session_token":"3494Zs5NtmHE9HtNDujjXH7zR0tjtfLAH2OUEkC2vrOezgSSFgyHJHb5So6sOMaHem4e1WnzXW4OoGLiWZwSDZvDzAHH",
                        "device_id":"285c3ff52aa28296"
                      }
              response = make_get_request "/user/api/v1/referral_info",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def get_referral_details(data)
              @response_data[data]
          end

      end
  end
end
