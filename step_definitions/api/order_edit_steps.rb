When(/^agent update order and removes item$/) do
  @api.order_edit.edit_order
end

Then(/^response from update_order should be "([^"]*)"$/) do |status_code|
  expect(@api.order_edit.status_code).to eql(status_code.to_i)
end

Then(/^should return "([^"]*)" with (\d+), (\d+)$/) do |message,no_of_items, total_price|
  expect(@api.order_edit.message).to eql(message)
  #expect(@api.order_edit.no_of_items).to eql(no_of_items)
  #expect(@api.order_edit.total_price).to eql(total_price)
end