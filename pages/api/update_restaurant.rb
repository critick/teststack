include RestHelper

module Pages
  module API
      class UpdateRestaurant < BaseAPI
        @status_code   = ""
        @response_data = ""
        @restaurant_id = ""
        @update_restaurant_body

          def initialize
            @fixture = TestData.get_fixtures("central")
            @update_restaurant_body  = File.read( $base_dir + '/data/api/body_update_restaurant.json')
            @update_restaurant_body_da  = File.read( $base_dir + '/data/api/body_update_restaurant_del_area.json')
          end

          def set_restaurant_information
            request_update_restaurant(0,0,0,"true")
            expect(get_status_code).to eq(200)
            expect(get_restaurant_details).not_to be_empty
          end

          def set_delivery_area
            request_update_delivery_area
            expect(get_status_code).to eq(200)
            expect(get_restaurant_details).not_to be_empty
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
              response = make_put_request "/restaurant/data_entry/restaurants/" + @fixture["3pl_resto_id"],body
              @status_code = response.code
              @response_data = JSON.parse(response.body)

          end

          def request_update_delivery_area
              body = JSON.parse(@update_restaurant_body_da)
              response = make_put_request "/restaurant/data_entry/delivery_areas/" + @fixture["3pl_resto_id"],body

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def get_status_code
            @status_code
          end
          def get_restaurant_details
              @response_data
          end

      end
  end
end
