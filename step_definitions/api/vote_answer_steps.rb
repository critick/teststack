When(/^"([^"]*)" user request for voteanswer$/) do |user_type|
      @api.voteanswer.post_response
end

Then(/^voteanswer responds with "([^"]*)"$/) do |status_code|
     expect(@api.voteanswer.response_status).to eql(status_code.to_i)
end
