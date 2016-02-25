When(/^Enter the restaurant form id$/) do
  @central.restaurants_page.search_field.set(@form_id)
  @central.restaurants_page.search_field.native.send_keys(:return)
end

Then(/^Restaurant name should be displayed$/) do
  expect(@central.restaurants_page).to have_link(@restaurant_name)
end

When(/^User deletes the restaurant$/) do
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurants_page.delete_restaurant
end

Then(/^Searching for Restaurant should not display the restaurant$/) do
  expect(@central.restaurants_page).should_not have_link(@restaurant_name)
end