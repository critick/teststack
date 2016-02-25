When(/^User navigates & enters the details$/) do
  @central.restaurants_page.navigate_create_restaurant
  @central.restaurant_create.create_restaurant
  @form_id = @central.restaurant_create.form_id
  @restaurant_name = @central.restaurant_create.restaurant_name
end

Then(/^Restaurant creation is successful$/) do
  expect(@central.restaurant_create).to have_content("Restaurant created successfully")
end

When(/^User creates restaurant using API$/) do
  @restaurant_id = @central.restaurant_create.create_restaurant_via_api
end

Then(/^User is able to create a new restaurant$/) do
  expect(@restaurant_id).to exist
end

Given(/^When user has the unique restaurant id$/) do
  puts @restaurant_id
end

When(/^User tries to delete the restaurant through API$/) do
  @response_code = @central.restaurant_create.delete_restaurant_via_api(@restaurant_id)
end

Then(/^User is able to delete a restaurant$/) do
  expect(@response_code).to eql(200)
end