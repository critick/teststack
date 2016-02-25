module Pages
  module API
    class PlaceOrder < BaseAPI

      def initialize
        @invoice = Pages::API::Invoice.new
        @create_resto_order =  Pages::API::CreateRestoOrder.new
      end

      def place_resto_order(delivery_type)
        @invoice.request_invoice_details_delivery_options delivery_type
        @draft_order_id = @invoice.get_invoice_details["payload"]["order_id"]
        # puts "The draft_order_id  : "  + @draft_order_id

        #create order
          @create_resto_order.request_create_order_delivery_options(@draft_order_id, delivery_type)
          @order_id = @create_resto_order.get_order_details["order_id"]
      end

      def get_order_id
          @order_id
      end

        end
      end
    end
