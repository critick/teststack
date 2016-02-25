require 'rest-client'
include RestHelper

module Pages
  module API
      class OrderDetails < BaseAPI
        attr_accessor :response_data
        @status_code = ""

          def get_status_code
            @status_code
          end

          def request_order_details(order_id)
              body = {
                        "session_token"=>"93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM"
                      }

              response = make_get_request "/restaurant/order_management/order/" + order_id ,body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def request_order_activity(order_id)
              body = {
                        "session_token"=>"93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM",
                        "order_id"=>order_id
                      }

              response = make_get_request "/restaurant/order_management/order_activity/",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty

          end

          def request_order_allocation_details(order_id)
              body = {
                        "session_token"=>"93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM",
                        "order_id"=>order_id
                      }

              response = make_get_request "/restaurant/order_management/order_allocation_details",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty

          end

          def request_recursive_menu(restaurant_id)
              body = {
                        "session_token"=>"93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM"
                      }

              response = make_get_request "/restaurant/api/restaurants/" + restaurant_id + "/get_recursive_menu",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty
          end

          def request_update_order(order_id)
              body_update_order = File.read( $base_dir + '/data/api/update_order.json')
              body = JSON.parse(body_update_order)
              body.merge!({
                    "order_id" => order_id
                })
              str_body = JSON[body] #Converting the json to string

              #here authentication is required in header
              @fixture =  TestData.get_fixtures("central")
              header =  {
                    :session_token => @fixture["session_token"]
                }

              body_hash ={
                :order_data => str_body
              }

              response = make_post_request_with_payload "/restaurant/order_management/update_order",body_hash,header
              @status_code = response.code
              @response_data = JSON.parse(response.body)
              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty
          end


          def get_order_details
              @response_data
          end

      end
  end
end
