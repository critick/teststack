module Pages
  module API
      class CreateRestoOrder < BaseAPI

        def initialize
          @create_order_body  = File.read( $base_dir + '/data/api/body_restaurant_create_order.json')
          @create_order_resto_old_app  = File.read( $base_dir + '/data/api/body_resto_create_order_old_app.json')
          @create_order_body_offer  = File.read( $base_dir + '/data/api/body_restaurant_create_order_offer.json')
        end

          def get_status_code
            @status_code
          end

          def request_create_order(draft_order_id)

            if draft_order_id.empty?
               body = JSON.parse(@create_order_resto_old_app)
              response = make_post_request "/restaurant/api/v1/restaurants/5366592fa29bfdf1010002ce/order",body
            else
             # puts "Create order request : " + body.to_s
              body = JSON.parse(@create_order_body)
              response = make_post_request "/api/v1/orders/" + draft_order_id + "/place",body
            end

              @status_code = response.code
              @response_data = JSON.parse(response.body)

              # puts "create order   " + @response_data.to_s
          end

          def request_create_order_delivery_options(draft_order_id, delivery_type)

            if delivery_type == "regular"

              create_order_body  = File.read( $base_dir + '/data/api/delivery_options_place_dbr.json')
              body = JSON.parse(create_order_body)
              response = make_post_request "/api/v1/orders/" + draft_order_id + "/place",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)

              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty

            elsif (delivery_type == "express") | (delivery_type == "extended delivery")

              create_order_body  = File.read( $base_dir + '/data/api/delivery_options_place_dbr.json')
              body = JSON.parse(create_order_body)
              body["order"].merge!({
                "payable_amount"=>146,
                "paid_by_cod"=>146
              })

              response = make_post_request "/api/v1/orders/" + draft_order_id + "/place",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)

              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty

            else
              puts "Error : Delivery Type parameter is Incorrect : " +   delivery_type
            end
          end

          def request_create_order_offer(draft_order_id)
              body = JSON.parse(@create_order_body_offer)
              response = make_post_request "/api/v1/orders/" + draft_order_id + "/place",body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def request_create_order_promotion(draft_order_id)
              body = JSON.parse(@create_order_body)
              response = make_post_request "/api/v1/orders/" + draft_order_id + "/place",body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def get_order_details
              @response_data
          end

      end
  end
end
