Given(/^A Restaurant with (\d+),(\d+),(\d+) and "([^"]*)"$/) do |pkg_charge,service_tax,service_charge,is_3pl|
    @api.update_restaurant.request_update_restaurant(pkg_charge,service_tax,service_charge,is_3pl)
    assert_equal(200,@api.update_restaurant.get_status_code)
		expect(@api.update_restaurant.get_restaurant_details).not_to be_empty

    @api.update_restaurant.request_update_delivery_area
    assert_equal(200,@api.update_restaurant.get_status_code)
    expect(@api.update_restaurant.get_restaurant_details).not_to be_empty
end

When(/^User makes a Request to Invoice API to a Resturant$/) do
    @api.invoice.request_invoice_details("Restaurant")
end

Then(/^Response contains (\d+),(\d+),(\d+),(\d+),(\d+) and (\d+)$/) do |cart_amount,delivery_charge,service_tax,pkg_charge,service_charge,payable_amount|
		  assert_equal(200, @api.invoice.status_code)
      if service_tax.to_f == 0 && pkg_charge.to_f == 0 && service_charge.to_f == 0
          assert_equal(payable_amount.to_f, @api.invoice.get_invoice_details["payload"]["payable_amount"])
          assert_equal(cart_amount.to_f, @api.invoice.get_invoice_details["payload"]["invoice"][0]["value"])
      else
         assert_equal(cart_amount.to_f, @api.invoice.get_invoice_details["payload"]["invoice"][0]["value"])
         assert_equal(delivery_charge.to_f,  @api.invoice.get_invoice_details["payload"]["invoice"][1]["value"])
         assert_equal(pkg_charge.to_f,  @api.invoice.get_invoice_details["payload"]["invoice"][2]["value"])
         assert_equal(service_charge.to_f,  @api.invoice.get_invoice_details["payload"]["invoice"][3]["value"])
      end

end

Given(/^consumer app with "([^"]*)" wants to call invoice api$/) do |platform|
  @api.invoice.set_platform(platform)
end

When(/^consumer app calls invoice$/) do
  @api.invoice.request_invoice_details("Homemade")
end

Then(/^the response status code should be "([^"]*)" for invoice api$/) do |status_code|
  expect(@api.invoice.status_code).to eql(status_code.to_i)
end

Then(/^order draft id should be returned$/) do
  expect(@api.invoice.draft_order_id).not_to be_empty
end
