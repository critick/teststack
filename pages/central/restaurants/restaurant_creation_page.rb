module Pages
  module Central
    module Restaurants
        class RestaurantCreationPage < SitePrism::Page

          element :title_text, :xpath, '//div[@class="panel-body"]/h3'
          element :name, '#name'
          element :form_id_field, '#form_id'
          element :create, 'Create'

          def create_restaurant
            name.click
            @restaurant_name = generate_test_restaurant_name
            name.send_keys(@restaurant_name)
            form_id_field.click

            @form_id = generate_string_form_id
            form_id_field.native.send_keys(@form_id)
            form_id_field.native.send_keys(:return)
            click_button('Create')
          end

          def restaurant_name
            @restaurant_name
          end

          def form_id
            @form_id
          end

          def by_ids_rest_status
            @by_ids_rest_status
          end

          def generate_string_form_id
            gen_char = (0...4).map { (65 + rand(26)).chr }.join
            gen_num = rand 1000..9999
            'POW-'+ gen_char.to_s + '-' + gen_num.to_s
          end

          def generate_test_restaurant_name
            gen_name = (0...4).map { (65 + rand(26)).chr }.join
            'TEST_' + gen_name.to_s
          end

          def create_restaurant_via_api
            url = "#{API_HOST_NAME}/restaurant/data_entry/restaurants/new"
            params = {
                      "session_token"=>SESSION_TOKEN,
                      "restaurant_name"=>generate_test_restaurant_name ,
                      "form_id"=>generate_string_form_id
                      }
            params_json = params.to_json
            response = RestClient.post(url, params_json, :content_type => :json, :accept => :json)
            response_body_json = JSON.parse response.body
            @new_restaurant_id = response_body_json['restaurant_id']
          end

          def delete_restaurant_via_api(restaurant_id)
            url = "#{API_HOST_NAME}/restaurant/data_entry/restaurants/delete"
            params = {
              "session_token"=>SESSION_TOKEN,
              "id"=>restaurant_id
            }
            params_json = params.to_json
            delete_response = RestClient.post(url, params_json, :content_type => :json, :accept => :json)
            @code = delete_response.code
          end

          def is_restaurant_active?(restaurant_id)
            url= "#{API_HOST_NAME}/restaurant/api/v1/restaurants/by_ids"
            params = {"app_version"=>"1.6.3",
              "session_token"=>SESSION_TOKEN,
              "device_id"=>DEVICE_ID,
              "platform"=>PLATFORM,
              "delivery_type"=>"DEFAULT",
              "ids"=>[restaurant_id]
              }
            params_json = params.to_json
            by_ids_response = RestClient.post(url, params_json, :content_type => :json, :accept => :json)
            by_ids_response_json = JSON.parse(by_ids_response)
            @by_ids_rest_id = by_ids_response_json["restaurants"][0]['id']
            @by_ids_rest_status = by_ids_response_json["restaurants"][0]['status']
          end
        end
    end
  end
end
