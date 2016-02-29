Given(/^"([^"]*)" user request for login$/) do |user_type|
    @api.login.set_session
end

When(/^params are "([^"]*)" username , "([^"]*)" password and "([^"]*)" session$/) do |user_type, pass_type, session_type|
    @response = @api.login.post_response
    @response_status = @api.login.response_status
end

Then(/^login responds with "([^"]*)" ,"([^"]*)" ,"([^"]*)" and list of keys$/) do |success,status_code, header, table|
     expect(@response_status).to eql(status_code.to_i)
     table.map_headers! {|header| header.downcase.to_sym }
     table.hashes.each do |row|
            expect(@api.login.response_data("data")[row[:user_details]]).not_to be_empty
     end
end
