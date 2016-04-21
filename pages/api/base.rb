module Pages
  module API
      class BaseAPI
        include RSpec::Matchers

          attr_accessor  :url, :params, :headers

          def initialize(args = {})
              @url     = args.fetch(:url ,'/')
              @params  = args.fetch(:params,{})
              @headers = args.fetch(:headers,{})
          end

          def response_status
              @response_status
          end

          def response_data(data)
              @response_data[data]
          end

          def response_headers(data)
              @response_headers[:data]
          end

          def get_response
              response = make_get_request @url, @params, @headers
              @response_status  = response.code
              #@response_data = JSON.parse(response.body)
              @response_headers = response.headers
          end

          def post_response
              response = make_post_request @url, @params, @headers
              @response_status = response.code
              #@response_data = JSON.parse(response.body, quirks_mode: true)
              @response_headers = response.headers
          end

      end
  end
end
