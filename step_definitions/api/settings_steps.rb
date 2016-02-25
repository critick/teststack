When (/^User makes a Request to Settings API$/) do
    @api.settings.set_platform (platform)
end

Then (/^User should receive the Response with status 200$/) do
     expect(@api.settings.get_status_code).to eql(200)
end

Given(/^platform of consumer app is "([^"]*)" while requesting settings api$/) do |platform|
  @api.settings.set_platform (platform)
end

When(/^consumer app requests settings api$/) do
  @response = @api.settings.get_settings
end

Then(/^the response status code should be "([^"]*)" for settings api$/) do |status_code|
    expect(@api.settings.get_status_code).to eql(status_code.to_i)
end

Then(/^"([^"]*)" as payment types should be returned$/) do |supported_payment_types|
    supported_payment_types.split(",").each do |payment_type|
      expect(@response["supported_payment_types"]).to have_key(payment_type)
    end
end
