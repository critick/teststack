When(/^Customer places the Order with Promotion$/) do
    #get the invoice details
      @api.invoice.request_invoice_details_promotion
      @draft_order_id = @api.invoice.get_invoice_details["payload"]["order_id"]
      # puts "get draft_order_id : " + @api.invoice.get_invoice_details.to_s

    #create order
      @api.create_resto_order.request_create_order_promotion(@draft_order_id)
      expect(@api.create_resto_order.get_order_details).not_to be_empty
      # puts "create order : " + @api.create_resto_order.get_order_details.to_s


      @order_id = @api.create_resto_order.get_order_details["order_id"]
      # puts "Order Id: " + @order_id.to_s

end


Then(/^CS User verify the order status to be "([^"]*)" and Offer is Applied$/) do |order_status|
      @api.order_details.request_order_details(@order_id)
      expect(@api.order_details.get_order_details).not_to be_empty
      @order_status=@api.order_details.get_order_details["order_status"]
      @is_promotion_order=@api.order_details.get_order_details["is_promotion_order"]
      # puts @api.order_details.get_order_details["order_status"]
      assert_equal(order_status, @order_status)
      assert_equal(true, @is_promotion_order)
end
