include RestHelper

module Pages
  module API
    module Models
      class RestaurantModel < BaseAPI

        @status_code   = ""
        @response_data = ""
        @update_restaurant_body=""

          def initialize
            @central_fixture = TestData.get_fixtures("central")
            @update_restaurant_body  = File.read( $base_dir + '/data/api/body_update_restaurant.json')
            @update_restaurant_body_da  = File.read( $base_dir + '/data/api/body_update_restaurant_del_area.json')
          end

          def set_restaurant_for_active_pos_and_DBR
            request_update_restaurant(0,0,0,"false")
            request_update_pos_active
          end

          def set_restaurant_for_inactive_pos_and_DBR
            request_update_restaurant(0,0,0,"false")
            request_update_pos_inactive
          end

          def set_delivery_area
            request_update_delivery_area
          end

          def request_update_pos_active
            body  = File.read( $base_dir + '/data/api/update_pos.json')
            body_json = JSON.parse(body)
            body_json.merge!({
              "has_restaurant_app"=> true,
              "is_app_service_on"=> true,
              "product_status"=> 1
              })
              response = make_post_request "/restaurant/restaurant_product/point_of_sale/"+ @central_fixture["3pl_resto_id"],body_json

              @status_code = response.code
              @response_data = JSON.parse(response.body)
              @message = @response_data["message"]

              expect(@status_code).to eq(200)
              expect(@response_data ).not_to be_empty
              expect(@message).not_to be_empty
              puts @message

          end

          def request_update_pos_inactive
            body  = File.read( $base_dir + '/data/api/update_pos.json')
            body_json = JSON.parse(body)
            body_json.merge!({
              "has_restaurant_app"=> false,
              "is_app_service_on"=> false,
              "product_status"=> 3
              })
              response = make_post_request "/restaurant/restaurant_product/point_of_sale/" + @central_fixture["3pl_resto_id"],body_json

              @status_code = response.code
              @response_data = JSON.parse(response.body)
              @message = @response_data["message"]

              expect(@status_code).to eq(200)
              expect(@response_data ).not_to be_empty
              expect(@message).not_to be_empty

              puts @message
          end


          def request_update_restaurant(packaging_charges, service_tax, service_charges, is_3pl)
              body = JSON.parse(@update_restaurant_body)
              body.merge! ({
                              "is_3pl"=> is_3pl,
                              "packaging_charges"=> packaging_charges.to_f,
                              "service_tax"=> service_tax.to_f,
                              "service_charges"=> service_charges.to_f,
                            })
              # puts "resto update request : " + body.to_s
              response = make_put_request "/restaurant/data_entry/restaurants/" + @central_fixture["3pl_resto_id"] ,body
              @status_code = response.code
              @response_data = JSON.parse(response.body)

          end

          def request_update_delivery_area
              body = JSON.parse(@update_restaurant_body_da)
              response = make_put_request "/restaurant/data_entry/delivery_areas/" + @central_fixture["3pl_resto_id"],body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end


          def get_restaurant_details
              @response_data
          end

          def get_status_code
            @status_code
          end

        end
      end
    end
  end
