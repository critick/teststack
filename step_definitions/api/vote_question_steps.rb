When(/^"([^"]*)" user request for votequestion$/) do |user_type|
      @api.votequestion.post_response
end

Then(/^votequestion responds with "([^"]*)"$/) do |status_code|
     expect(@api.votequestion.response_status).to eql(status_code.to_i)
end
