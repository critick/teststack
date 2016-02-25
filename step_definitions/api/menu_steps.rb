When(/^User selects "([^"]*)" restaurants$/) do |restaurant_id|
  @api.menu.fetch_recommended_items(restaurant_id)
end

Then(/^response from recommendation should be "([^"]*)"$/) do |status_code|
  expect(@api.menu.status_code_from_recommendation).to eql(status_code.to_i)
end

Then(/^recommendation have should have non zero items$/) do
  expect(@api.menu.get_no_recommended_items).to be > 0
end


When(/^User selects "([^"]*)" restaurant to view menu$/) do |restaurant_id|
  @api.menu.fetch_menu_items(restaurant_id)  
end

Then(/^response from get flat menu should be "([^"]*)"$/) do |status_code|
  expect(@api.menu.status_code_from_menu).to eql(status_code.to_i)
end

Then(/^menu items should contain "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)" "([^"]*)"$/) do |category,timing,choice,choice_option,item,item_size,item_price|
	@api.menu.verify_menu_items(category,timing,choice,choice_option,item,item_size,item_price)
	expect(@api.menu.is_category_present).to be true
	expect(@api.menu.is_choice_present).to be true
	expect(@api.menu.is_choice_option_present).to be true
	expect(@api.menu.is_item_present).to be true
	expect(@api.menu.is_item_size_present).to be true
	expect(@api.menu.is_item_price_present).to be true
end