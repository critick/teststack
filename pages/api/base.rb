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
              if is_null(response.body)
                 puts "response body is a null string"
              else
                 @response_data = JSON.parse(response.body, quirks_mode: true)
              end
          end

          def post_response
              response = make_post_request @url, @params, @headers
              @response_status = response.code
              if is_null(response.body)
                  puts "response body is a null string"
              else
                 @response_data = JSON.parse(response.body, quirks_mode: true)
              end
          end

          def delete_response
              response = make_delete_request @url, @params, @headers
              @response_status = response.code
              @response_headers = response.headers
              if is_null(response.body)
                 puts "response body is a null string" #raise
              else
                 @response_data = JSON.parse(response.body, quirks_mode: true)
              end
          end

          def patch_response
              response = make_patch_request @url, @params, @headers
              @response_status = response.code
              @response_headers = response.headers
              if is_null(response.body)
                  puts "response body is a null string"
              else
                 @response_data = JSON.parse(response.body, quirks_mode: true)
              end
          end

           def is_null(string)
               return string.nil? || string.empty?
           end

      end
  end
end
