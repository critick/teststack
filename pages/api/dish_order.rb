
module Pages
  module API
      class DishOrder < BaseAPI
        @status_code = ""
        @restaurant_body

          def initialize
            @dish_order_body  = File.read( $base_dir + '/data/api/dish_order.json')
          end

          def get_status_code
            @status_code
          end

          def place_order
            app_version = "3.6.8"
              if @platform=="ANDROID"
                app_version = "3.6.8"
              else
                app_version = "1.8.1"
              end
              body = JSON.parse(@dish_order_body)
              body.merge! ( {
                         "app_version": app_version,
                          "platform": @platform,
                       })
              response = make_post_request "/api/v1/orders/56828c5e123fea817d00006c/place",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

      end
  end
end
