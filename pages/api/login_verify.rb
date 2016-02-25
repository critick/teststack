include RestHelper
module Pages
  module API
      class LoginVerify < BaseAPI
        @status_code = ""

          def get_status_code
            @status_code
          end

          def request_login_verify(otp,pre_token)
            
                  @platform    ="ANDROID"
                  @app_version = "3.6.8"
                
              body = {
                        "post_token"  => otp,
                        "device_id"   => "831efbc8fc0f7e4e",
                        "pre_token"   => pre_token,
                        "app_version" =>@app_version,
                        "platform"    =>@platform
                      }
              response = make_post_request "/user/api/v1/login_with_sms/verify",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

      end
  end
end
