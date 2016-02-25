When(/^user request for address details on "([^"]*)"$/) do |platform|
    @api.get_address.set_platform (platform)
    @get_response = @api.get_address.get_response
end

Then(/^"([^"]*)" are fetched with "([^"]*)"$/) do |address,status_code|
    expect(@api.get_address.response_status).to eql(status_code.to_i)
    expect(@api.get_address.response_data(address)).not_to be_empty
end

When(/^user save new address details on "([^"]*)"$/) do |platform|
    @api.add_address.set_platform (platform)
    @response = @api.add_address.post_response
end

Then(/^"([^"]*)" are saved with "([^"]*)" and "([^"]*)"$/) do |address,id,status_code|
  expect(@api.add_address.response_status).to eql(status_code.to_i)
  expect(@api.add_address.response_data(id).to_s).not_to be_empty
end
