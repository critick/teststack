Given(/^consumer app with "([^"]*)" wants to book an item$/) do |platform|
  @api.booking.set_platform(platform)
end

When(/^consumer app books item$/) do
  @booking_id = @api.booking.do_booking
end

Then(/^the response status code should be "([^"]*)" for booking api$/) do |status_code|
  expect(@api.booking.status_code).to eql(status_code.to_i)
end

Then(/^booking id should be returned$/) do
  expect(@booking_id).to be > 0
end