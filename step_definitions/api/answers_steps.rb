When(/^"([^"]*)" user request for answers$/) do |user_type|
      @api.answers.post_response
end

Then(/^answers responds with "([^"]*)"$/) do |status_code|
     expect(@api.answers.response_status).to eql(status_code.to_i)
end
