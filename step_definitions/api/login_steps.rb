When(/^"([^"]*)" user request for login$/) do |user_type|
    @api.login
    @login_response = @api.login.post_response
    @login_response_status = @api.login.response_status
end

Given(/^params are "([^"]*)" username and "([^"]*)" password$/)  do |user_type, pass_type|
    @api.login.update_credentials(user_type,pass_type)
end

Then(/^login responds with "([^"]*)" ,"([^"]*)" ,"([^"]*)" and list of keys$/) do |success,status_code, header, table|
     expect(@login_response_status).to eql(status_code.to_i)
     expect((@api.login.response_data("success").to_s)).to eql(success)
     if success == "true"
        table.map_headers! {|header| header.downcase.to_sym }
        table.hashes.each do |row|
              expect(@api.login.response_data("data")[row[:userdetails]]).not_to be_empty
        end
     end
end
