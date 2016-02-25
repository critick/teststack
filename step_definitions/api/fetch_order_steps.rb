When(/^pos app fetch orders of type "([^"]*)"$/) do |order_type|
@response = @api.restaurant_product.fetch_orders order_type
end

Then(/^the response status code should be "([^"]*)" for fetch order api$/) do |status_code|
expect(@api.restaurant_product.get_status_code).to eql(status_code.to_i)
end

Then(/^should return orders of type "([^"]*)"$/) do |order_type|
count = @response["count"]
expect(count).to be >= 0

@response["payload"].each do |order|
  expect(order_type).to eql(order["order_tab"])
end
end

Then(/^newly placed order from homemade should be returned in pos app fetch order api$/) do
  order_status = @response["order_status"]
  order_id = @response["order_id"]

  if order_status.eql?("ADDED")
    @response = @api.restaurant_product.fetch_orders "NEW"
  elsif order_status.eql?("SCHEDULED")
    @response = @api.restaurant_product.fetch_orders "SCHEDULED"
  end

  expected_order_id = ""
  @response["payload"].each do |order|
    expected_order_id = order["id"]
    break if order_id.eql?(expected_order_id)
  end
end

Then(/^order payload should contains following list of keys$/) do |table|
  @response["payload"].each do |order|
    table.hashes.each do |row|
      expect(order[row[:header]]).not_to be_empty
    end
  end
end


When(/^pos app fetch live order$/) do
  order_id = @response["order_id"]
  @response = @api.restaurant_product.fetch_live_order order_id
  expect(@response["payload"]["id"]).to eql(order_id)
end

Then(/^live order details should be fetched$/) do |table|
  table.hashes.each do |row|
    expect(@response["payload"][row[:header]]).not_to be_empty
  end
end

When(/^consumer app place order from restaurant enabled for pos$/) do
  @response =  @api.restaurant_order.place_order_from_pos_restaurant
end

Then(/^newly placed order from restaurant enabled for pos should be returned in pos app fetch order api$/) do
  order_status = @response["order_status"]
  order_id = @response["order_id"]

  @response = @api.restaurant_product.fetch_orders_non_homemade "NEW"

  expected_order_id = ""
  @response["payload"].each do |order|
    expected_order_id = order["id"]
    break if order_id.eql?(expected_order_id)
  end
  expect(expected_order_id).to eql(order_id)
end
