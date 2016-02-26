When(/^"([^"]*)"user request for signup$/) do |user_type|
    @response  = @api.auth.post_response
    @response_status = @api.auth.response_status
end

Then(/^user is created with "([^"]*)" and "([^"]*)"$/) do |success,status_code|
    expect(@response_status).to eql(status_code.to_i)
end
