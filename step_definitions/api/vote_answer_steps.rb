When(/^"([^"]*)" user request for "([^"]*)" voteanswer$/) do |user_type,vote_type|
      binding.pry
      case vote_type
      when "add"
           @api.voteanswer.post_response
      when "delete"
          @api.voteanswer.delete_response
      end
end

Then(/^voteanswer responds with "([^"]*)"$/) do |status_code|
     expect(@api.voteanswer.response_status).to eql(status_code.to_i)
end
