module Pages
  module API
      class HomemadeOrder < BaseAPI
        @status_code = ""
        @homemade_body
        @booking
        @invoice

          def initialize
            @booking = Pages::API::Booking.new  
            @invoice = Pages::API::Invoice.new  
            @homemade_body  = File.read( $base_dir + '/data/api/homemade_order.json')            
            
          end

          def get_status_code
            @status_code
          end

          # Place order is dependent on booking and invoice
          # We are using pages from booking to get start time 
          # and end time. For getting draft_order_id from invoice
          def place_order            
            app_version = "3.6.8"
              if @platform=="ANDROID"
                app_version = "3.6.8"
              else
                app_version = "1.8.1"
              end                          
              booking_id = @booking.do_booking
              @invoice.request_invoice_details("Homemade")
              order_id = @invoice.draft_order_id
              body = JSON.parse(@homemade_body)
              body.merge! ( {
                         "app_version": app_version,
                          "platform": @platform,
                       })

             body["order"].merge! ( {
               "order_timings":{
               "delivery_time_start": @booking.get_start_time,
               "delivery_time_end": @booking.get_end_time,
               "timing_id":"5659a47b123fea02eb00006d"
               },
               "booking_id":booking_id
             })

            response = make_post_request "/api/v1/orders/"+order_id+"/place",
            body
            @status_code = response.code
            response_data = JSON.parse(response.body)
          end
      end
  end
end
