Given(/^Order is in the Added state$/) do

  @api.restaurant_model.set_restaurant_for_inactive_pos_and_DBR
  @api.place_order.place_resto_order "regular"
  @order_id=@api.place_order.get_order_id

end

Then(/^CS user is able to get order details$/) do
  @central_fixture = TestData.get_fixtures("central")

  @api.order_details.request_order_details(@order_id)
  expect(@api.order_details.get_order_details).not_to be_empty

  order_id = @api.order_details.get_order_details["id"]
  restaurant_id =@api.order_details.get_order_details["restaurant_id"]
  user_first_name = @api.order_details.get_order_details["user"]["first_name"]
  user_email = @api.order_details.get_order_details["user"]["email"]
  user_address_id = @api.order_details.get_order_details["address"]["id"]
  cart_details = @api.order_details.get_order_details["cart"]["order_items"]
  payable_amount = @api.order_details.get_order_details["order_payment"]["payable_amount"]
  restaurant_form_id = @api.order_details.get_order_details["restaurant"]["form_id"]

  expect(order_id).to eq(@order_id)
  expect(restaurant_id).to eq(@central_fixture["3pl_resto_id"])
  expect(user_first_name).to eq(@central_fixture["user_first_name"])
  expect(user_email).to eq(@central_fixture["user_email"])
  expect(user_address_id).to eq(@central_fixture["user_address_id"])
  expect(cart_details).not_to be_empty
  expect(restaurant_form_id).to eq(@central_fixture["restaurant_form_id"])

end

Then(/^CS User should be able to get the Recursive Menu with "([^"]*)" and "([^"]*)"$/) do |category, item|

    @api.order_details.request_recursive_menu(@central_fixture["3pl_resto_id"])
    category_array = @api.order_details.response_data["restaurant"]["menu_categories"]

    expect(category_array[0]["name"]).to eq(category)
    expect(category_array[0]["items"][0]["name"]).to eq(item)

end

Then(/^CS User should be able to update the order and gets message "([^"]*)"$/) do |msg|
  @api.order_details.request_update_order(@order_id)
  # puts @api.order_details.response_data
  expect(@api.order_details.response_data["message"]).to eq(msg)
end
