module Pages
  module API
      class AppBaseAPI
        include RSpec::Matchers

           def initialize (url, params)
               @url       =  url
               @params    =  params
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
