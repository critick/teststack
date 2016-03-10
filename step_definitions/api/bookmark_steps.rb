When(/^"([^"]*)" user request for bookmark$/) do |user_type|
      @api.bookmark.post_response
end

Then(/^bookmark responds with "([^"]*)"$/) do |status_code|
     expect(@api.bookmark.response_status).to eql(status_code.to_i)
end
