require 'rest-client'
module Pages
  module API
      class RestaurantAppAction < BaseAPI

        def initialize

        end

          def accept_order(order_id)

            if order_id.to_s.empty?
              expect {false}.to raise_error("The order id is empty")
            else
              body = {
                "order_id"=> order_id,
                "delivery_time"=> "1",
                "accept"=> "true",
                "session_token"=> "93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM",
                "device"=> "agent",
                "is_3pl"=> "false"
              }

              response = make_post_request "/restaurant/restaurant_product/action",body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
              @message=@response_data["message"]

              expect(@status_code).to eq(200)
              expect(@response_data ).not_to be_empty
              expect(@message).to eq("Order accepted successfully")
            end

          end

          def decline_order(order_id)

            if order_id.to_s.empty?
              expect {false}.to raise_error("The order id is empty")
            else
              body = {
                "order_id"=> order_id,
                "decline_reason"=> "Item Unavailable",
                "accept"=> "false",
                "session_token"=> "93035L4PmQqefs2fdzhrStZo2rw3nJCxwjq7YVkIRbTVv7NqIksBzx95S71qu3Vz8E9gOISxzLDkaGn3DsTR7ER0HzgMM",
                "device"=>"agent"
              }

              response = make_post_request "/restaurant/restaurant_product/action",body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
              @message=@response_data["message"]

              expect(@status_code).to eq(200)
              expect(@response_data ).not_to be_empty
              expect(@message).to eq("You will get a confirmation call")
            end

          end

          def get_response
              @response_data
          end

      end
  end
end
