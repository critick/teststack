Given(/^platform of consumer app is "([^"]*)" while getting scheduled orders$/) do |platform|
  @api.pastorders.set_platform(platform)
end

When(/^consumer app requests for scheduled orders of a user$/) do
  @response =  @api.pastorders.get_scheduled_orders
end

Then(/^the response status code should be "([^"]*)" for scheduled orders api$/) do |status_code|
  expect(@api.pastorders.status_code).to eql(status_code.to_i)
end

Then(/^scheduled orders should be returned$/) do
  @response["orders"].each do |order|
    order_status = order["order_status"]
    expect(order_status).to eql("SCHEDULED")
  end
end

When(/^"([^"]*)" consumer app requests for order status of a user$/) do |platform|

  @api.pastorders.set_platform(platform)

  order_status = @response["order_status"]
  order_id = @response["order_id"]

  @response =  @api.pastorders.get_order_status order_id

  @response["order_status"].each do |order|
    expected_order_id = order["id"]
    if order_id.eql?(expected_order_id)
      order_status = order["order_status"]
      expect(order_status).to eql("ADDED")
    end
    break if order_id.eql?(expected_order_id)
  end
end

Then(/^the response status code should be "([^"]*)" for order status api$/) do |status_code|
  expect(@api.pastorders.status_code).to eql(status_code.to_i)
end

Then(/^order status of ongoing order should be returned$/) do

  @response["order_status"].each do |order|
    order_status = order["order_status"]
    expect(order_status).not_to be_empty
  end

end

Given(/^platform of consumer app is "([^"]*)" while getting past orders$/) do |platform|
  @api.pastorders.set_platform(platform)
end

When(/^consumer app requests for past orders of a user$/) do
  @response =  @api.pastorders.get_past_orders
end

Then(/^the response status code should be "([^"]*)" for past orders api$/) do |status_code|
  expect(@api.pastorders.status_code).to eql(status_code.to_i)
end

Then(/^past orders should be returned$/) do
  @response["orders"].each do |order|
    order_status = order["order_status"]
    expect(order_status).to eql("DELIVERED")
  end
end
