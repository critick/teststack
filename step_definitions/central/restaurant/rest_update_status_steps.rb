Given(/^User is on Update Status page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_profile.update_status_btn.click
end

When(/^Changed the state of restaurant to ACTIVE$/) do
  @central.restaurant_update.update_status(@restaurant_data["status"], @restaurant_data["comment"])
  expect(page).not_to have_css('#loading-message',visible: true)
end

Then(/^Restaurant should be changed to ACTIVE$/) do
  expect(@central.restaurant_update).to have_content('ACTIVE')
end
