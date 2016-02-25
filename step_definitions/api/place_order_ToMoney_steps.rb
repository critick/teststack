Given(/^platform of consumer app is "([^"]*)" while placing order with payment method as "([^"]*)"$/) do |platform, payment_method|
    @api.restaurant_order.set_platform(platform)
end

When(/^consumer app place order with payment method as "([^"]*)" from restaurant$/) do |payment_method|
  @response =  @api.restaurant_order.place_order_from_restaurant_with_wallet(payment_method)
end

Then(/^payment method should be "([^"]*)"$/) do |tinyowl_payment|
  order_id = @response["order_id"]

  payment_method =  @api.restaurant_order.get_payment_method(order_id)
  expect(payment_method).to eql(tinyowl_payment)
end
