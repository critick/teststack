
Given(/^User is on Miscellaneous page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.tinyowl_representative
  @central.restaurant_misc.link_to_miscellaneous.click
  @central.restaurant_misc.cost_for_two
end

When(/^Enter the mandatory fields$/) do
  @central.restaurant_misc.fill_misc_details(@restaurant_data["cuisine1"], @restaurant_data["cuisine2"], @restaurant_data["cost_for_two"])
  expect(page).not_to have_css('#loading-message',visible: true)
  sleep 2
end

Then(/^User is able to save changes on misc page$/) do
  @central.restaurant_misc.cost_for_two
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_misc.title_misc
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.tinyowl_representative
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_misc.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_misc.title_misc
  expect(page).to have_text('Chinese')
  expect(page).to have_text('Italian')
end
