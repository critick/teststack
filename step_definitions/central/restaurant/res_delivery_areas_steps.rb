Given(/^I am on delivery areas page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.tinyowl_representative
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.delivery_areas.link_to_delivery_areas.click
  #expect(page).not_to have_css('#loading-message',visible: true)
  @central.delivery_areas.add_delivery_area_btn
end

When(/^I enter the delivery areas$/) do
  @central.delivery_areas.fill_delivery_areas(@restaurant_data['biglocality'],@restaurant_data['sub_locality'],@restaurant_data['mda'],@restaurant_data['delivery_charge'],@restaurant_data['delivery_time'])
end

Then(/^I should be able to save delivery areas successfully$/) do
  @central.delivery_areas.load(id: @restaurant_id)
  @central.delivery_areas.add_delivery_area_btn
  expect(@central.delivery_areas).to have_text(@restaurant_data['sub_locality'])
end
