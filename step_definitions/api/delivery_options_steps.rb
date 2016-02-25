Given(/^A Restaurant with 3PL capability Delivery options enabled and Updated Delivery Area$/) do
  @api.update_restaurant.set_restaurant_information
  @api.update_restaurant.set_delivery_area
end

When(/^Customer choose "([^"]*)" Delivery and places the Order$/) do |delivery_type|
  #get the Delivery Options
  @api.delivery_options.request_delivery_options true
  if delivery_type == "extended delivery"
    @api.delivery_options.request_delivery_options true, delivery_type
  end

if delivery_type == "regular"
  # get the invoice details

    @api.invoice.request_invoice_details_delivery_options delivery_type
    @draft_order_id = @api.invoice.get_invoice_details["payload"]["order_id"]
    # puts "The draft_order_id  : "  + @draft_order_id

    #create order
      @api.create_resto_order.request_create_order_delivery_options(@draft_order_id, delivery_type)

      @order_id = @api.create_resto_order.get_order_details["order_id"]
      # puts "Order Id: " + @order_id.to_s
  elsif (delivery_type == "express") | (delivery_type == "extended delivery")
  # get the invoice details

    @api.invoice.request_invoice_details_delivery_options delivery_type
    @draft_order_id = @api.invoice.get_invoice_details["payload"]["order_id"]

    #create order
      @api.create_resto_order.request_create_order_delivery_options(@draft_order_id, delivery_type)

      @order_id = @api.create_resto_order.get_order_details["order_id"]
      # puts "Order Id: " + @order_id.to_s
  elsif delivery_type == "extended delivery"

  else
    puts "The delivery_type is not Correct"
  end
end
