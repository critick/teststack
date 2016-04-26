When(/^I vote for "([^"]*)"$/) do |choice|
    #@api.vote.set_vote(choice)
    #@api.vote.post_response
end

Then(/^app should respond with "([^"]*)"$/) do |status|
    #@api.result.get_response
    #expect(@api.result.response_status).to eql(status.to_i)
end
