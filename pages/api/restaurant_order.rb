module Pages
  module API
      class RestaurantOrder < BaseAPI
        @status_code = ""
        @restaurant_body

          def initialize
            @fixture         =  TestData.get_fixtures("consumer_app")
            @app_version    =  @fixture["app_version"]
            @restaurant_body  = File.read( $base_dir + '/data/api/restaurant_order.json')
            @restaurant_multichoice_order  = File.read( $base_dir + '/data/api/restaurant_multichoice_order.json')
            @invoice_json  = File.read( $base_dir + '/data/api/invoice_restaurant_order.json')
            @invoice_multichoice_json  = File.read( $base_dir + '/data/api/invoice_restaurant_multichoice_order.json')
            @invoice = Pages::API::Invoice.new

          end

          def get_status_code
            @status_code
          end

          def place_order_from_restaurant

            @invoice.request_invoice_details("Restaurant",@invoice_json)
            draft_order_id = @invoice.draft_order_id

              body = JSON.parse(@restaurant_body)
              body.merge! ( {
                         "order_id": draft_order_id,
                         "app_version": @app_version,
                          "platform": @platform,

                       })
              response = make_post_request "/api/v1/orders/" +draft_order_id +"/place",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end

          def place_order_from_restaurant_with_multichoice

              @invoice.request_invoice_details("Restaurant",@invoice_multichoice_json)
              draft_order_id = @invoice.draft_order_id

                body = JSON.parse(@restaurant_multichoice_order)
                body.merge! ( {
                           "order_id": draft_order_id,
                           "app_version": @app_version,
                            "platform": @platform,

                         })
                response = make_post_request "/api/v1/orders/" +draft_order_id +"/place",
                body
                @status_code = response.code
                response_data = JSON.parse(response.body)
          end

          def place_order_from_restaurant_with_wallet(payment_method)

            @restaurant_ToMoney_order  = File.read( $base_dir + '/data/api/place_order_ToMoney.json')
            @invoice_ToMoney_json  = File.read( $base_dir + '/data/api/invoice_ToMoney_order.json')

              @invoice.request_invoice_details("Restaurant",@invoice_ToMoney_json)
              draft_order_id = @invoice.draft_order_id

                if payment_method == "TINYOWL_WALLET"
                   @payment_sdk = "CITRUS"
                   @to_money = true
                else
                   @payment_sdk   = payment_method
                   payment_method = "WALLET"
                   @to_money = false
                end

                body   = JSON.parse(@restaurant_ToMoney_order)
                @params = {
                            "order_id":     draft_order_id,
                            "app_version":  @app_version,
                            "platform":     @platform,
                            "payment": {
                                    "method":                payment_method,
                                    "paid_by_wallet":        @to_money ? 0 : 1,
                                    "paid_by_tinyowl_money": @to_money ? 1 : 0,
                                    "sdk":                   @payment_sdk
                              }
                            }
                params = JSON.parse(@params.to_json)
                body.merge! (params)
                response = make_post_request "/api/v1/orders/" +draft_order_id + "/place", body
                @status_code = response.code
                response_data = JSON.parse(response.body)
          end

          def get_payment_method (order_id)
            @orderdetails = Pages::API::OrderDetails.new
            orderdetailresponse =  @orderdetails.request_order_details(order_id)
              payment_method = orderdetailresponse["payment_method"]
          end

          def place_order_from_pos_restaurant
            @restaurant_non_homemade_order  = File.read( $base_dir + '/data/api/pos/place_order_non_homemade.json')
            @invoice_json  = File.read( $base_dir + '/data/api/pos/invoice_non_homemade_order.json')

            @invoice.request_invoice_details("Restaurant",@invoice_json)
            draft_order_id = @invoice.draft_order_id

              body = JSON.parse(@restaurant_non_homemade_order)
              body.merge! ( {
                         "order_id": draft_order_id,
                         "app_version": @app_version,
                          "platform": @platform,

                       })
              response = make_post_request "/api/v1/orders/" +draft_order_id +"/place",
              body
              @status_code = response.code
              response_data = JSON.parse(response.body)
          end
      end
  end
end
