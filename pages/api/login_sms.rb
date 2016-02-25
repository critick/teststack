include RestHelper

module Pages
  module API
      class LoginSMS < BaseAPI
        @status_code = ""

          def get_status_code
            @status_code
          end

          def request_login_sms(number)

                  @platform   ="ANDROID"
                  @app_version = "3.6.8"

              body = {
                        "name"          =>"test",
                        "phone_number"  =>number,
                        "email"         =>"any@nomail.com",
                        "device_id"     =>"831efbc8fc0f7e4e",
                        "app_version"   =>@app_version,
                        "platform"      =>@platform
                      }
              response = make_post_request "/user/api/v1/login_with_sms",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

      end
  end
end
