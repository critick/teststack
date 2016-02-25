Given(/^platform of consumer app is "([^"]*)" while placing order$/) do |platform|
    @api.restaurant_order.set_platform(platform)
end

When(/^consumer app place order from restaurant$/) do
  @response =  @api.restaurant_order.place_order_from_restaurant
end

When(/^consumer app place order from restaurant having multichoice options$/) do
  @response =  @api.restaurant_order.place_order_from_restaurant_with_multichoice
end

Then(/^the response status code should be "([^"]*)" for order api$/) do |status_code|
  expect(@api.restaurant_order.get_status_code).to eql(status_code.to_i)
end

Then(/^order details should be returned with "([^"]*)"$/) do |status|
  order_status = @response["order_status"]
  order_id = @response["order_id"]

  expect(order_status).to eql(status)
  expect(order_id).not_to be_empty
end
