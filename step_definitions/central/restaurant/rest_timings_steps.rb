Given(/^User is on Restaurant Timings page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_timings.link_to_timings.click
  puts page.current_url
  @central.restaurant_timings.add_operational_timing
  expect(page).not_to have_css('#loading-message',visible: true)
end

When(/^Entered operational, item & delivery timings$/) do
  @central.restaurant_timings.fill_timings(@restaurant_data["start_time"], @restaurant_data["end_time"], @restaurant_data["days"])
end

Then(/^I should be able to save successfully$/) do

  @central.restaurant_profile.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_timings.load(id: @restaurant_id)
  expect(page).not_to have_css('#loading-message',visible: true)
  page.has_css?('#timing_start_3_0') && page.has_css?('#timing_start_1_0') && page.has_css?('#timing_start_4_0')
end
