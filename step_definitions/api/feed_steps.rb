Given(/^User has phone with platform "([^"]*)" and app version "([^"]*)"$/) do |platform, version|
  @api.restaurants.set_platform(platform)
  @api.restaurants.set_version(version)
end

When(/^User enters place with "([^"]*)" for restaurants$/) do |place_id|
  @actual_restaurant = @api.restaurants.fetch_restaurants(place_id)
end

Then(/^response from feed should be "([^"]*)"$/) do |status_code|
  expect(@api.restaurants.get_status_code).to eql(status_code.to_i)
end

Then(/^feed should return "([^"]*)" and "([^"]*)"$/) do |expected_locality_id,expected_restaurant|
  expect(@api.restaurants.locality_id).to eql(expected_locality_id)
  expect(@actual_restaurant).to eql(expected_restaurant)
end

When(/^User enters place with "([^"]*)" for dishes$/) do |place_id|
  @actual_dish = @api.restaurants.fetch_dishes(place_id)
end

Then(/^feed should return (\d+) and "([^"]*)"$/) do |expected_locality_id,expected_dish|
  expect(@api.restaurants.locality_id).to eql(expected_locality_id)
  expect(@actual_dish).to eql(expected_dish)
end
