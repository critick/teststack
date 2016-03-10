When(/^"([^"]*)" user request for comments$/) do |user_type|
      @api.comments.post_response
end

Then(/^comments responds with "([^"]*)"$/) do |status_code|
     expect(@api.comments.response_status).to eql(status_code.to_i)
end
