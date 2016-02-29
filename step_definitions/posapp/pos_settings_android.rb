Given(/^I am on login page$/) do
     @app.login.app_permission
end

When(/^I login in with "([^"]*)" and "([^"]*)"$/) do |number,password|
    @app.login.log_in(number,password)
end


Given(/^Settings are "([^"]*)" , "([^"]*)" and "([^"]*)"$/) do |app_status,service_status,email|
   settings = Settings.new
   settings.save_pos_setings(app_status,service_status,email)
end

Then(/^I should see "(.*?)"$/) do |status|
  case status
      when "home"
           @app.home.verify_login("Home")
      else
          expect(@app.login).to have_toast(status)
  end
end
