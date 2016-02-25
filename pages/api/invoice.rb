module Pages
  module API
    class Invoice < BaseAPI
          @status_code = ""
          @response_data = ""
          @restaurant_id = "541d82bd091d4946fa0035fc"
          @invoice_body
          @invoice_homemade
          @draft_order_id
          @booking
      attr_accessor :status_code,:draft_order_id

      def initialize
        @booking             = Pages::API::Booking.new
        @invoice_body        = File.read( $base_dir + '/data/api/body_invoice.json')
        @invoice_body_offer  = File.read( $base_dir + '/data/api/body_invoice_offer.json')
        @invoice_homemade    = File.read( $base_dir + '/data/api/invoice_homemade.json')
        @invoice_magic       = File.read( $base_dir + '/data/api/invoice_magic.json')
      end

        def request_invoice_details(restaurant_type,invoice_body=@invoice_body)
          case restaurant_type
          when "Homemade"
            body = JSON.parse(@invoice_homemade)
            body["order"].merge! ( {
              "order_timings":{
                "delivery_time_start": @booking.get_start_time,
                "delivery_time_end": @booking.get_end_time,
                "timing_id":"5659a47b123fea02eb00006d"
              }
              })
          when "Restaurant"
            body = JSON.parse(invoice_body)
            end

            response = make_post_request "/api/v1/orders/invoice",body
            @status_code = response.code
            @response_data = JSON.parse(response.body)
            @draft_order_id = @response_data["payload"]["order_id"]

          end

          def request_invoice_details_offer
            body = JSON.parse(@invoice_body_offer)
            response = make_post_request "/api/v1/orders/invoice",body

            @status_code = response.code
            @response_data = JSON.parse(response.body)
            @draft_order_id = @response_data["payload"]["order_id"]
          end

          def request_invoice_details_promotion
            body = JSON.parse(@invoice_body)
            body["order"].merge!({
              "promotion_id": "568bac3b123feaadfe0003c4",
              })

            response = make_post_request "/api/v1/orders/invoice",body

            @status_code = response.code
            @response_data = JSON.parse(response.body)
            @draft_order_id = @response_data["payload"]["order_id"]
          end

          def request_invoice_details_delivery_options sOption

            if sOption == "regular"
              invoice_body  = File.read( $base_dir + '/data/api/delivery_options_invoice_dbr.json')
              body = JSON.parse(invoice_body)
              response = make_post_request "/api/v1/orders/invoice",body

              @response_data = JSON.parse(response.body)
              @status_code = response.code

              expect(@status_code).to eq(200)
              expect(@response_data).not_to be_empty

            elsif (sOption == "express") | (sOption == "extended delivery")
                invoice_body  = File.read( $base_dir + '/data/api/delivery_options_invoice_dbr.json')
                body = JSON.parse(invoice_body)
                body.merge!({
                  "meta_data"=>{"delivery_type"=>"dbt"}
                  })

                response = make_post_request "/api/v1/orders/invoice",body

                @response_data = JSON.parse(response.body)
                @status_code = response.code

                expect(@status_code).to eq(200)
                expect(@response_data).not_to be_empty
            end

            @status_code = response.code
            @response_data = JSON.parse(response.body)
            @draft_order_id = @response_data["payload"]["order_id"]

         end


          def get_invoice_details
            @response_data
          end

        end
      end
    end
