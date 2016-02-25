Given(/^User is on Restaurant Menu page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.tinyowl_representative
  @central.restaurant_menu.edit_menu_btn.click
  @central.restaurant_menu.add_category_btn # wait for add_category_btn
  expect(page).not_to have_css('#loading-message',visible: true)
end

When(/^Entered menu details$/) do
  @central.restaurant_menu.make_menu(@restaurant_data["category_name"], @restaurant_data["sub_category_name"], @restaurant_data["item_name"], @restaurant_data["item_description"], @restaurant_data["quantity"], @restaurant_data["price"])
  expect(page).not_to have_css('#loading-message',visible: true)
end

Then(/^Menu should be able to be pushed successfully$/) do
  page.execute_script("window.alert = function() {return true;}")
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_menu.validate_menu_btn.click
  # TODO - dirty solution , update to not use sleep.
  sleep 4
  expect(page).not_to have_css('#loading-message',visible: true)
  expect(page).to have_css('#push_changes',visible: true)
  page.execute_script("window.confirm = function() {return true;}")
  @central.restaurant_menu.push_changes_btn.click
  sleep 4
end
