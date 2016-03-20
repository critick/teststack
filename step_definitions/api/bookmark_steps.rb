When(/^"([^"]*)" user request for "([^"]*)" bookmark$/) do |user_type,bookmark_type|
      case bookmark_type
      when "add"
           @api.bookmark.post_response
      when "delete"
          @api.bookmark.delete_response
      end
end

Then(/^bookmark responds with "([^"]*)"$/) do |status_code|
     expect(@api.bookmark.response_status).to eql(status_code.to_i)
end
