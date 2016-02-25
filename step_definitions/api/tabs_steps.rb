
Given(/^platform of consumer app is "([^"]*)"$/) do |platform|
@api.tabs.set_platform (platform)
end

When(/^consumer app requests tabs api for locality (\d+)$/) do |localityid|
  @response = @api.tabs.request_tabs (localityid)
end

Then(/^the response status code should be "([^"]*)"$/) do |status_code|
  expect(@api.tabs.get_status_code).to eql(status_code.to_i)
end

Then(/^"([^"]*)" should be available$/) do |tabs_type|
actual=""
  @response["tabs"].each do |type|
      actual +=type["type"]+","
  end
  puts actual
  expect(actual.chop!).to eql(tabs_type)
end
