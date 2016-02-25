module Pages
  module API
      class OrderEdit < BaseAPI
        @status_code = ""
        @place_order_json
        @invoice_json
        @update_order_json
        @session_token
        @order_id
        attr_accessor :status_code,:no_of_items,:total_price,:message

          def initialize
            @session_token = "202553PYaN7EYykefAV0dvRKWyR0o9SDibosNwd8CXFTZQ6T9ikIlEfFYuYi3FAcnr2rI0OZY92qSEsqdZiL3URk79ggYY"
            @invoice = Pages::API::Invoice.new  
            @invoice_json  = File.read( $base_dir + '/data/api/invoice_params_order_edit.json')
            @place_order_json  = File.read( $base_dir + '/data/api/place_order_params_order_edit.json')
            @update_order_json = File.read( $base_dir + '/data/api/update_order_params.json')             
          end

          # Place order is dependent on invoice
          # For getting draft_order_id from invoice
          def place_order            
            app_version = "3.6.8"
              if @platform=="ANDROID"
                app_version = "3.6.8"
              else
                app_version = "1.8.1"
              end                          
              @invoice.request_invoice_details("Restaurant",@invoice_json)
              draft_order_id = @invoice.draft_order_id
              body = JSON.parse(@place_order_json)
              body.merge! ( {
                         "app_version": app_version,
                          "platform": @platform,
              })

            response = make_post_request "/api/v1/orders/"+draft_order_id+"/place",
            body
            @status_code = response.code
            response_data = JSON.parse(response.body)            
            @order_id = response_data["order_id"]
          end

          def edit_order
            place_order
            update_order_body = JSON.parse(@update_order_json)
            update_order_body["order_id"] = @order_id            
            @update_order_json = @update_order_json.gsub!('SG803044023',@order_id)            
            response = make_post_request  "/restaurant/order_management/update_order?session_token="+@session_token, {:order_data=>@update_order_json}
            @status_code = response.code
            response_data = JSON.parse(response.body)
            @message = response_data["message"]
          end

      end
  end
end
