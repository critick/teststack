Given(/^platform of consumer app is "([^"]*)" while requesting offer api$/) do |platform|
  @api.offers.set_platform (platform)
end

When(/^consumer app requests offer api with valid "([^"]*)"$/) do |promo_code|
  @response = @api.offers.get_offer_details (promo_code)
end

Then(/^the response status code should be "([^"]*)" for offer api$/) do |status_code|
  expect(@api.offers.get_status_code).to eql(status_code.to_i)
end

Then(/^"([^"]*)" should be returned$/) do |expected_offer_id|
  actual_offer_id = @response["offers"][0]["id"]
  expect(actual_offer_id).to eql(expected_offer_id)
end

When(/^consumer app requests offer api with invalid "([^"]*)"$/) do |promo_code|
  @response = @api.offers.get_offer_details (promo_code)
end

Then(/^"([^"]*)" and "([^"]*)" should be returned$/) do |message, error|
    actual_message = @response["message"]
    actual_error = @response["error"]

    expect(actual_message).to eql(message)
    expect(actual_error).to eql(error)
end
