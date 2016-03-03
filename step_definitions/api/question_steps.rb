Given(/^"([^"]*)" user request for questions$/) do |user_type|
    @api.questions.get_response
end

Then(/^questions responds with "([^"]*)"$/) do |status_code|
    expect(@api.questions.response_status).to eql(status_code.to_i)
end
