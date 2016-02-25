module Pages
  module API
      class Inventories < BaseAPI

        def initialize
            @fixture =  TestData.get_fixtures("pos_app")
        end

        attr_accessor :status_code,:message,:item


        def get_slot_time
          Time.zone = "Kolkata"
          slot_time = {
            "start_time": Time.zone.now.to_i,
            "end_time": Time.zone.now.to_i
          }
          if(Time.zone.now.hour < 16)
            slot_time["start_time"] = Time.zone.now.middle_of_day().to_i
            slot_time["end_time"] = (Time.zone.now.middle_of_day() .advance(hours: 4,minutes: 30)).to_i
          #  puts slot_time["start_time"], slot_time["end_time"]
            else
              slot_time["start_time"] = (Time.zone.now.middle_of_day() .advance(hours: 4,minutes: 30)).to_i
              slot_time["end_time"] = (Time.zone.now.middle_of_day() .advance(hours: 11,minutes: 30)).to_i
          #    puts slot_time["start_time"], slot_time["end_time"]
          end
          slot_time
        end

        def get

          slot_time= self.get_slot_time

          body = {
            "restaurant_id": @fixture["homemade_resto_id"],
            "start_time": slot_time["start_time"],
            "end_time": slot_time["end_time"],
            "session_token": @fixture["session_token"]

          }

          #puts body

          response = make_get_request_with_header "/restaurant/inventories",body
          @status_code = response.code
          #puts response.body

          response_data = JSON.parse(response.body)
          @item = {
            booked: "",
            sold: "",
            quantity: ""
          }

          response_data['payload'].each do |payload|
            if (payload["item_size_id"] == @fixture["item_size_id"])
             @item["booked"] = payload["booked"]
             @item["sold"] = payload["sold"]
             @item["quantity"] = payload["quantity"]
           end
         end
           response_data
        end


     end
  end
end
