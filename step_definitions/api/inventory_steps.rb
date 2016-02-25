
Given(/^platform for consumer app is set while placing homemade order$/) do
    @api.homemade.set_platform("ANDROID")
end

Given(/^user books homemade menu item using consumer app$/) do
  @booking_id = @api.booking.do_booking
end

When(/^consumer app discard the cart and call release api$/) do
  @api.booking.release @booking_id
end

Then(/^the response status code should be "([^"]*)" for release api$/) do |status_code|
  expect(@api.booking.status_code).to eql(status_code.to_i)
end

Then(/^message should be returned as "([^"]*)"$/) do |message|
  expect(@api.booking.message).to eql(message)
end

When(/^order get cancel from omp then inventory should be released$/) do

  order_id = @response["order_id"]
  @api.inventories.get
  sold_before_cancellation = @api.inventories.item["sold"]


 @response = @api.order.cancel order_id

#below sleep is to synscronise cancel order api and inventory get api calls
 sleep 3
@api.inventories.get
sold_after_cancellation = @api.inventories.item["sold"]


expect(sold_after_cancellation).to be == (sold_before_cancellation-1)

end


Given(/^restaurant web app call inventories api$/) do
  @response = @api.inventories.get
end

Then(/^the response status code should be "([^"]*)" for inventories api$/) do |status_code|
  expect(@api.inventories.status_code).to eql(status_code.to_i)
end

Then(/^payload should be returned$/) do

  expect(@api.inventories.item["booked"]).to be >= 0
  expect(@api.inventories.item["sold"]).to be >= 0
  expect(@api.inventories.item["quantity"]).to be >= 0

end

And(/^inventory is recorded before placing order$/) do
  @response = @api.inventories.get
end

Then(/^inventory should be updated after placing order$/) do
sold_before_placing = @api.inventories.item["sold"]
@api.inventories.get
sold_after_placing = @api.inventories.item["sold"]


expect(sold_after_placing).to be == (sold_before_placing+1)

end
