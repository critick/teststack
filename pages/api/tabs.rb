require 'rest-client'
module Pages
  module API
      class Tabs < BaseAPI
        @status_code = ""

          def get_status_code
            @status_code
          end

          def request_tabs (localityid)
              app_version = "3.6.8"
                if @platform=="ANDROID"
                  app_version = "3.6.8"
                else
                  app_version = "1.8.1"
                end
              body = {
                        "locality_id" => localityid,
                        "app_version" => app_version,
                        "platform" => @platform,
                        "session_token":"290233UmADHMv44w05f7AqNZAYlK8BVslrMN8ZgKylPAKnA7IzbE4wNd7Kp4Rdd053yZ8qGP1mBsDNDSijRdqNkEzwqgNN",
                        "device_id":"285c3ff52aa28296"
                      }
              #puts body
              response = RestClient.post ENV['SERVER'] + "/restaurant/api/v1/tabs",
              body.to_json,:content_type => :json, :accept => :json
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

      end
  end
end
