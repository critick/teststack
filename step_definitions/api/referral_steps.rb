Given(/^users are in "([^"]*)"$/) do |platform|
  @api.referral.set_platform (platform)
end

When(/^user request for referral details$/) do
  @response = @api.referral.request_referral_details
end

Then(/^"([^"]*)","([^"]*)" are fetched with "([^"]*)"$/) do |referral_code,message,status_code|
  expect(@api.referral.get_status_code).to eql(status_code.to_i)
  expect(@api.referral.get_referral_details(referral_code)).not_to be_empty
  expect(@api.referral.get_referral_details(message)).not_to be_empty
end
