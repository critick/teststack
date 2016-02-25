Given(/^platform of consumer app is "([^"]*)" while getting tinyowl money balance$/) do |platform|
  @api.tomoney.set_platform (platform)
end

When(/^consumer app requests for tinyowl money balance of a user$/) do
  @response = @api.tomoney.request_tomoney_balance
end

Then(/^the response status code should be "([^"]*)" for tinyowl money balance api$/) do |status_code|
  expect(@api.tomoney.get_status_code).to eql(status_code.to_i)
end

Then(/^available tinyowl money and total tinyowl money should be returned$/) do
   total_tinyowl_money=@response["total_tinyowl_money"].to_i
   available_tinyowl_money=@response["available_tinyowl_money"].to_i

    expect(total_tinyowl_money).to be >= 0
    expect(available_tinyowl_money).to be >= 0
end
