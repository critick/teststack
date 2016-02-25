Given(/^platform of consumer app is "([^"]*)" while placing dish order$/) do |platform|
    @api.dish_order.set_platform(platform)
end

When(/^consumer app place dish order$/) do
  @response =  @api.dish_order.place_order
end

Then(/^the response status code should be "([^"]*)" for dish order$/) do |status_code|
  expect(@api.dish_order.get_status_code).to eql(status_code.to_i)
end

Then(/^dish order details should be returned$/) do
  order_status = @response["order_status"]
  order_id = @response["order_id"]

  expect(order_status).to eql("ADDED")
  expect(order_id).not_to be_empty
end
