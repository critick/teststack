Given(/^a new user onboards to tinyowl and calls for "([^"]*)"$/) do |api_name|
  @api_response = @api.send(api_name).get_response
  @api_status   = @api.send(api_name).response_status
end

Then(/^"([^"]*)" are fetched with "([^"]*)" and keys$/) do |api_name, status, table|
     expect(@api_status).to eql(status.to_i)
     table.map_headers! {|header| header.downcase.to_sym }
     table.hashes.each do |row|
          expect(@api_response[row[:keys]]).not_to be_empty
     end
end


Given(/^User checkout order "([^"]*)" from "([^"]*)" restaurants$/) do |arg1, arg2|
      @magic_invoice_response = @api.magic_invocie.get_response
      @magic_invoice_status   = @api.magic_invocie.response_status
end

When(/^Invoices are generated with "([^"]*)" and  "([^"]*)" keys$/) do |order, count, keys|
     expect(@magic_invoice_status).to eql(status.to_i)
     table.map_headers! {|header| header.downcase.to_sym }
     table.hashes.each do |row|
           expect(@api_response[row[:keys]]).not_to be_empty
     end
end

When(/^Places Order with generated invoice and "([^"]*)"$/) do |payment_method|
    @magic_place_response = @api.magic_place.get_response
    @magic_place_status   = @api.magic_place.response_status
end

Then(/^Order placed with "([^"]*)" and keys$/) do |status, keys|
     expect(@magic_place_status).to eql(status.to_i)
     table.map_headers! {|header| header.downcase.to_sym }
     table.hashes.each do |row|
           expect(@api_response[row[:keys]]).not_to be_empty
     end
end
