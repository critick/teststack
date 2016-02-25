require 'rest-client'
module Pages
  module API
      class Menu < BaseAPI

        def initialize
          @body  =  {
                :slot_start_time => "1450420200",
                :slot_end_time   => "1450436400",
                :session_token   => "202553PYaN7EYykefAV0dvRKWyR0o9SDibosNwd8CXFTZQ6T9ikIlEfFYuYi3FAcnr2rI0OZY92qSEsqdZiL3URk79ggYY",
                :device_id       => "1de6f62a0bc129a5",
                :app_version     => @app_version,
                :platform        => @platform
          }

          @response_data={}
        end

        attr_accessor :is_category_present, :get_no_recommended_items, :status_code_from_recommendation, :status_code_from_menu
        attr_accessor :is_timing_present, :is_choice_present, :is_choice_option_present, :is_item_present, :is_item_size_present,:is_item_price_present

        def fetch_recommended_items (restaurant_id)
            @response_data = RestClient.get ENV['SERVER'] + "/restaurant/api/v1//restaurants/"+restaurant_id+"/recommendations",{:params => @body}
            @status_code_from_recommendation = @response_data.code
            @response_data = JSON.parse(@response_data.body)
            @get_no_recommended_items = @response_data['item_ids'].count
            
        end

        def fetch_menu_items (restaurant_id)
            @body.merge!({
              :slot_start_time => "0",
              :slot_end_time   =>"0"
            })
            @response_data = RestClient.get ENV['SERVER'] + "/restaurant/api/v1/restaurants/"+restaurant_id+"/get_flat_menu",{:params => @body}
            @status_code_from_menu = @response_data.code
        end

        def verify_menu_items(e_category,e_timing,e_choice,e_choice_option,e_item,e_item_size,e_item_price)
          @response_data = JSON.parse(@response_data.body)
          @is_category_present      = !@response_data['menu_categories'].select{|menu_category| menu_category["name"] == e_category}.empty?
          @is_timing_present        = !@response_data['timings'].select{|timing| timing["name"] == e_timing}.empty?
          @is_choice_present        = !@response_data['choices'].select{|choice| choice["name"] == e_choice}.empty?
          @is_choice_option_present = !@response_data['choice_options'].select{|choice_option| choice_option["name"] == e_choice_option}.empty?
          @is_item_present          = !@response_data['items'].select{|item| item["name"] == e_item}.empty?
          @is_item_size_present     = !@response_data['item_sizes'].select{|item_size| item_size["size"] == e_item_size}.empty?
          @is_item_price_present    = !@response_data['item_prices'].select{|item_price| item_price["price"].to_s == e_item_price}.empty?
        end

      end
  end
end
