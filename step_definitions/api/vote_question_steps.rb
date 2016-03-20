When(/^"([^"]*)" user request for "([^"]*)" votequestion$/) do |user_type,vote_type|
    case vote_type
    when "add"
         @api.votequestion.post_response
    when "delete"
        @api.votequestion.delete_response
    end
end

Then(/^votequestion responds with "([^"]*)"$/) do |status_code|
     expect(@api.votequestion.response_status).to eql(status_code.to_i)
end
