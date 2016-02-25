require 'rest-client'
module Pages
  module API
      class PlaceRestoOrder < BaseAPI
        @status_code = ""
        @response_data = ""

        def initialize
          @create_order_body  = File.read( $base_dir + '/data/api/body_restaurant_create_order.json')
        end

          def get_status_code
            @status_code
          end

          def request_place_order(order_id)
              body = {
                "order_id" => order_id,
                "time" => "1",
                "is_3pl"=>true,
                "session_token"=>"93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM"
              }
              
              response = make_put_request "/omp/api/" + order_id + "/place",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def get_response
              @response_data
          end

      end
  end
end
