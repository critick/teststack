Given(/^I am on login page$/) do
     @posapp.login.app_permission
end

When(/^I login in with "([^"]*)" and "([^"]*)"$/) do |number,password|
    @posapp.login.log_in(number,password)
end


Given(/^Settings are "([^"]*)" , "([^"]*)" and "([^"]*)"$/) do |app_status,service_status,email|
   settings = PosSettings.new
   settings.save_pos_setings(app_status,service_status,email)
end

Then(/^I should see "(.*?)"$/) do |status|
  case status
      when "home"
           @posapp.home.verify_login("Today's Orders")
#      else
#          expect(@posapp.login).to have_toast(status)
  end
end
