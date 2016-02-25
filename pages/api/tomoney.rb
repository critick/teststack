include RestHelper
module Pages
  module API
      class ToMoney < BaseAPI
        @status_code = ""

          def get_status_code
            @status_code
          end

          def request_tomoney_balance
              app_version = "3.6.8"
                if @platform=="ANDROID"
                  app_version = "3.6.8"
                else
                  app_version = "1.8.1"
                end
              body = {
                        "app_version" => app_version,
                        "platform" => @platform,
                        "session_token":"290233UmADHMv44w05f7AqNZAYlK8BVslrMN8ZgKylPAKnA7IzbE4wNd7Kp4Rdd053yZ8qGP1mBsDNDSijRdqNkEzwqgNN",
                        "device_id":"285c3ff52aa28296"
                      }
              response = make_get_request "/user/api/v1/tinyowl_money/balance",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

      end
  end
end
