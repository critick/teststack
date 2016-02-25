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
