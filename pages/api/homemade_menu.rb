include RestHelper
module Pages
  module API
      class HomemadeMenu < BaseAPI

        @status_code         = ""
        @response_data       = ""
        @restaurant_id       = ""

        def initialize
          @fixture =  TestData.get_fixtures("menu_planner")
        end

          def get_status_code
            @status_code
          end

          def request_homemade_menu_details(restaurant_id,locality_id,slot_start_time,slot_end_time)
              body = {
                        "slot_start_time": slot_start_time.to_i,
                        "slot_end_time": slot_end_time.to_i,
                        "locality_id": locality_id.to_i,
                        "app_version": "3.6.8",
                        "platform": "ANDROID",
                        "device_id": "213d25587693bb86"
                      }
              response = make_get_request "/restaurant/api/v1/restaurants/"+restaurant_id+"/get_flat_menu/",body
              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def request_create_new_item(item_name)

              filename = $base_dir + "/data/testdata/chef.jpg"
              name = "New Chef "+[*('A'..'Z')].sample(8).join


              puts "Create new item : " + item_name
              body =  {
                        "name": item_name,
                        "restaurant_id": @fixture["restaurant_id"],
                        "menu_category_id": @fixture["menu_category_id"],
                        "tags": "TEST",
                        "veg_type": "VEG",
                        "chef_id": "3",
                        "image": File.new(filename , 'rb'),
                        "item_sizes_attributes": {
                          "0": {
                            "restaurant_id": @fixture["restaurant_id"],
                            "timing_ids": [
                              "5659a47b123fea02eb000069"
                            ],
                            "price": "600",
                            "cost_price": "400",
                            "serves": "4",
                            "size_id": "53064601a29bfd7b5f000001",
                            "has_limited_inventory": "true"
                          }
                        }
                     }

               header =  {
                           :cookies => {'_tinyowl_session' => @fixture["tinyowl_session"]}
                         }

              response = make_post_request_with_payload '/restaurant/items', body, header

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end



          def request_update_existing_item(item_name)
              
              body =   {
                            "name": item_name,
                            "restaurant_id": @fixture["restaurant_id"],
                            "description": "Item Updated",
                            "menu_category_id": @fixture["menu_category_id"],
                            "tags": "TEST",
                            "veg_type": "VEG",
                            "status": "2",
                            "chef_id": "3",
                            "id": @fixture["item_id"],
                            "item_sizes_attributes": {
                              "0": {
                                "_id": "56c32bbf123feacf5b00008d",
                                "cost_price": "400",
                                "price": "650",
                                "serves": "4",
                                "timing_ids": [
                                  "5659a47b123fea02eb000069"
                                ],
                                "size_id": "53064601a29bfd7b5f000001",
                                "has_limited_inventory": "true"
                              }
                            }
                          }

               header =  {
                           :cookies => {'_tinyowl_session' => @fixture["tinyowl_session"]}
                         }

              response = make_put_request_with_payload '/restaurant/items/' + @fixture["item_id"], body, header

              @status_code = response.code
              @response_data = JSON.parse(response.body)
          end

          def get_homemade_menu_details(data)
              @response_data[data]
          end

          def get_response_data
              @response_data
          end


      end
  end
end
