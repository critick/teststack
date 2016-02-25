module Pages
  module API
      class AppBaseAPI
        include RSpec::Matchers

           def initialize (url, params)
               @url       =  url
               @params    =  params
           end

          def set_platform (platform)
              @platform = platform
              case @platform
                  when "ANDROID"
                  @version = @fixture["app_version_android"]
                  when "IOS"
                  @version = @fixture["app_version_ios"]
                  when "WEB"
                  @version = @fixture["app_version_web"]
              end
           end

          def response_status
              @response_status
          end

          def response_data(data)
              @response_data[data]
          end

          def get_response
              response = make_get_request @url, @params
              @response_status = response.code
              @response_data = JSON.parse(response.body)
          end

          def post_response
              response = make_post_request @url, @params
              @response_status = response.code
              @response_data = JSON.parse(response.body)
          end
      end
  end
end
