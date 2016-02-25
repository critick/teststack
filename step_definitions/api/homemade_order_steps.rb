Given(/^platform of consumer app is "([^"]*)" while placing homemade order$/) do |platform|
    @api.homemade.set_platform(platform)
end

When(/^consumer app place order from homemade$/) do
  @response =  @api.homemade.place_order
end

Then(/^the response status code should be "([^"]*)" for homemade order$/) do |status_code|
  expect(@api.homemade.get_status_code).to eql(status_code.to_i)
end

Then(/^homemade order details should be returned$/) do
  order_status = @response["order_status"]
  order_id = @response["order_id"]

  #expect(order_status).to eql("ADDED")
  puts order_id
  puts order_status
  
  expect(order_status).not_to be_empty
  expect(order_id).not_to be_empty
end
