require 'rest-client'
module Pages
  module API
      class Restaurants < BaseAPI
        @status_code = ""
        @locality_id = ""
        @restaurant_body
        attr_accessor :locality_id
          
          def initialize
            @restaurant_body  = File.read( $base_dir + '/data/api/body_restaurant_feed.json')
          end

          def get_status_code
            @status_code
          end

          def fetch_restaurants (placeid)
              body = JSON.parse(@restaurant_body)
              body.merge! ( {
                        "preferred_tab": "RESTAURANTS",
                        "place_id": placeid,
                        "app_version": @version,
                        "platform": @platform,
                        "session_token": "202553PYaN7EYykefAV0dvRKWyR0o9SDibosNwd8CXFTZQ6T9ikIlEfFYuYi3FAcnr2rI0OZY92qSEsqdZiL3URk79ggYY",
                        "device_id": "29302bb62d3b0fa0"
                      })
              @restaurant_body = body.to_json
              response = make_post_request "/restaurant/api/v1/feed", body
              @status_code = response.code
              response_data = JSON.parse(response.body)
              @locality_id = response_data['locality_id']
              restaurants = response_data['restaurants']['restaurants']
              if h = restaurants.find { |h| h['id'] == '5503036b983a529e7000002d' }
                actual_restaurant_name = h['name']
              else
                puts 'Not found!'
              end
          end


          def fetch_dishes (placeid)
              
              body = JSON.parse(@restaurant_body)
              body.merge! ( {
                        "preferred_tab"=> "DISHES",
                        "place_id"     => placeid,
                        "app_version"  => @version,
                        "platform"     => @platform,
                        "session_token"=> "202553PYaN7EYykefAV0dvRKWyR0o9SDibosNwd8CXFTZQ6T9ikIlEfFYuYi3FAcnr2rI0OZY92qSEsqdZiL3URk79ggYY",
                        "device_id"    => "29302bb62d3b0fa0"
                      })
              #puts body
              response = make_post_request "/restaurant/api/v1/feed", body
              @status_code = response.code
              response_data = JSON.parse(response.body)
              @locality_id = response_data['locality_id'].to_s
              dishes = response_data['dishes']['dishes']
              if h = dishes.find { |h| h['id'] == '558dc2a8fa125913650007b6' }
                actual_dish = h['name']
              else
                puts 'Not found!'
              end
          end



      end
  end
end
