When (/^I search for "([^"]*)" in autocomplete$/) do |query_text|
     @api.location.set_query(query_text)
     @get_response = @api.location.get_response
end

Then(/^I see  prediction for this "([^"]*)"$/) do |place|
     expect(place).to eq(@get_response["predictions"][0]["description"])
end
