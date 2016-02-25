module Pages
  module API
    module RestaurantProduct
      class OrdersInfo < BaseAPI

        def initialize
          @fixture =  TestData.get_fixtures("pos_app")
        end

        def fetch_orders type
          body = {
            "type" => type,
            "session_token" => @fixture["session_token"]
          }

          response = make_get_request "/restaurant/restaurant_product/fetch_orders" ,body
          @status_code = response.code
          @response_data = JSON.parse(response.body)
        end

        def get_status_code
          @status_code
        end

        def fetch_live_order order_id
          body = {
            "order_id" => order_id,
            "session_token" => @fixture["session_token"]
          }

          response = make_get_request "/restaurant/restaurant_product/fetch_live_order" ,body
          @status_code = response.code
          @response_data = JSON.parse(response.body)
        end
        def fetch_orders_non_homemade type
          body = {
            "type" => type,
            "session_token" => @fixture["non_homemade_session_token"]
          }

          response = make_get_request "/restaurant/restaurant_product/fetch_orders" ,body
          @status_code = response.code
          @response_data = JSON.parse(response.body)
        end
      end
    end
  end
end
