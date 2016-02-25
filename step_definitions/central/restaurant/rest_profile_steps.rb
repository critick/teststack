
When(/^user clicks on Edit button$/) do
  click_link 'Edit'
end

Then(/^Restaurant Profile should be visible$/) do
  @central.restaurant_profile.has_tinyowl_representative?
end

Given(/^User is on profile page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.locality
end

When(/^Enter the restaurant profile fields$/) do
  @central.restaurant_profile.fill_details(@restaurant_data["city"], @restaurant_data["locality"], @restaurant_data["locality_name"], @restaurant_data["address"], @restaurant_data["latitude"], @restaurant_data["longitude"], @restaurant_data["email"], @restaurant_data["phone_num_for_sms"])
  expect(page).not_to have_css('#loading',visible: true)
  @central.restaurant_profile.address
end

Then(/^User is able to save changes$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading',visible: true)
  @central.restaurant_profile.city.has_text?(@restaurant_data["city"])
end
