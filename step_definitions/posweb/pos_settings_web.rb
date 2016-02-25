Given(/^I am on login page$/) do
     @posweb.login.load
end

When(/^I login in with "([^"]*)" and "([^"]*)"$/) do |number,password|
    @posweb.login.log_in(number,password)
end


Given(/^Settings are "([^"]*)" , "([^"]*)" and "([^"]*)"$/) do |app_status,service_status,email|
   settings = PosSettings.new
   settings.save_pos_setings(app_status,service_status,email)
end
