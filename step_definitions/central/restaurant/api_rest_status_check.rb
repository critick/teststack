
When(/^User fires the api for getting status on app$/) do
  @central.restaurant_create.is_restaurant_active?(@restaurant_id)
end

Then(/^Restaurant is ACTIVE in api$/) do
  expect(@central.restaurant_create.by_ids_rest_status).to eq('ACTIVE')
end