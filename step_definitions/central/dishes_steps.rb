When(/^user create new dish$/) do
  wait_for_page_load @central.dishes
  @central.dishes.click_new_dish
  wait_for_page_load @central.new_dish

  @central.new_dish.create
  wait_for_page_load @central.dishes
end

Then(/^"([^"]*)" message should be shown on dish panel$/) do |arg|
  expect(@central.dishes).to have_text(arg)

end

When(/^user edits dish$/) do
  @central.dishes.click_edit_dish
  wait_for_page_load @central.new_dish
  @central.new_dish.edit
end
When(/^search for restaurant$/) do

  wait_for_page_load @central.restaurants
  @central.restaurants.search_restaurant
  wait_for_page_load @central.restaurants

end

When(/^view dishes for that restaurant$/) do
  @central.restaurants.view_dishes
  wait_for_page_load @central.dishes
end
