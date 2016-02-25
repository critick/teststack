Given(/^A Restaurant with 3PL capability$/) do
      @api.update_restaurant.request_update_restaurant(0,0,0,"true")
      assert_equal(200,@api.update_restaurant.get_status_code)
      expect(@api.update_restaurant.get_restaurant_details).not_to be_empty
      # puts "resto update  " + @api.update_restaurant.get_restaurant_details.to_s

      @api.update_restaurant.request_update_delivery_area
      assert_equal(200,@api.update_restaurant.get_status_code)
      expect(@api.update_restaurant.get_restaurant_details).not_to be_empty
end

When(/^Customer places the Order$/) do
    #get the invoice details
      @api.invoice.request_invoice_details("Restaurant")
      @draft_order_id = @api.invoice.get_invoice_details["payload"]["order_id"]
      # puts "get draft_order_id : " + @api.invoice.get_invoice_details.to_s

    #create order
      @api.create_resto_order.request_create_order(@draft_order_id)
      expect(@api.create_resto_order.get_order_details).not_to be_empty
      # puts "create order : " + @api.create_resto_order.get_order_details.to_s

      @order_id = @api.create_resto_order.get_order_details["order_id"]
      # puts "Order Id: " + @order_id.to_s

end

When(/^Customer places the Order with Offer$/) do
    #get the invoice details
      @api.invoice.request_invoice_details_offer
      @draft_order_id = @api.invoice.get_invoice_details["payload"]["order_id"]
      # puts "get draft_order_id : " + @api.invoice.get_invoice_details.to_s

    #create order
      @api.create_resto_order.request_create_order_offer(@draft_order_id)
      expect(@api.create_resto_order.get_order_details).not_to be_empty
      # puts "create order : " + @api.create_resto_order.get_order_details.to_s


      @order_id = @api.create_resto_order.get_order_details["order_id"]
      puts "Order Id: " + @order_id

end

When(/^Customer places the Order with Older App/) do

    #create order
      @api.create_resto_order.request_create_order("")
      expect(@api.create_resto_order.get_order_details).not_to be_empty

      @order_id = @api.create_resto_order.get_order_details["order_id"]
      puts "Order Id: " + @order_id

end



When(/^CS User Place the order from panel$/) do
    # CS User Place Order
      @api.place_resto_order.request_place_order(@order_id)
      assert_equal("Order successfully placed", @api.place_resto_order.get_response["meta"]["message"])

    #CS User Verifies Order Status
      @api.order_details.request_order_details(@order_id)
      expect(@api.order_details.get_order_details).not_to be_empty
      @order_status=@api.order_details.get_order_details["order_status"]
      assert_equal("PLACED", @order_status)

end

Then(/^CS User verify the order status to be "([^"]*)"$/) do |order_status|

    #CS User Verifies Order Status
      @count = 0
      begin

        @api.order_details.request_order_details(@order_id)
        expect(@api.order_details.get_order_details).not_to be_empty
        @order_status=@api.order_details.get_order_details["order_status"]
        # puts @api.order_details.get_order_details["order_status"]

        sleep 5
        @count += 1

      end while order_status != @order_status and @count < 10

      assert_equal(order_status, @order_status)

end
