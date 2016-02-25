module Pages
  module API
      class Booking < BaseAPI

        def initialize
          @booking_body  = File.read( $base_dir + '/data/api/booking.json')
          @fixture =  TestData.get_fixtures("consumer_app")
        end

        attr_accessor :status_code,:booking_id,:message

        #Here we are geting start time and end time for booking an item
        #As we would have time where there will not slots available we need to have logic
        #to check current time and get start time accordingly
        def get_start_time
          Time.zone = "Kolkata"
          start_time = Time.zone.now.to_i

          # get time if current time is between 4 to 7
          if(Time.zone.now.hour < 12)
            puts Time.zone.now.middle_of_day().to_s
            start_time = Time.zone.now.middle_of_day().to_i
          elsif(Time.zone.now.hour >= 16 and Time.zone.now.hour < 19)
              start_time = (Time.zone.now.beginning_of_hour  + (60*60*4)).to_i
          else
            start_time = (Time.zone.now.beginning_of_hour+ (60*60)).to_i
          end
        end

        def get_end_time
          Time.zone = "Kolkata"
          end_time = Time.zone.now.to_i
          if(Time.zone.now.hour < 12)
            puts (Time.zone.now.middle_of_day().advance(:hours => 1)).to_s
            end_time = (Time.zone.now.middle_of_day().advance(:hours => 1)).to_i
          elsif (Time.zone.now.hour >= 16 and Time.zone.now.hour < 19)
            end_time = (Time.zone.now.beginning_of_hour + (60*60*5)).to_i
          else
            end_time = (Time.zone.now.beginning_of_hour + (60*60*2)).to_i
          end
        end

        def do_booking
          booking_body = JSON.parse(@booking_body)
          booking_body.merge! ( {
            "timing_slot":{
            "start_time":get_start_time,
            "end_time":get_end_time
            }
          })

          response = make_post_request "/restaurant/api/v1/booking",booking_body
          @status_code = response.code
          response_data = JSON.parse(response.body)

          @booking_id = response_data["booking_id"]
        end

        def release (id)


          body = {
            "booking_id": id,
            "app_version": @fixture["app_version"],
            "platform": @fixture["platform"],
            "session_token": @fixture["session_token"],
            "device_id": @fixture["device_id"]
          }

          response = make_put_request "/restaurant/api/v1/booking/release",body
          @status_code = response.code

          response_data = JSON.parse(response.body)
          @message = response_data["message"]
          response_data
        end

     end
  end
end
