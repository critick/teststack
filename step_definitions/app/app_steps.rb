Given(/^I am on login page$/) do
     @app.login
     @app.login.load_login
end

When(/^"([^"]*)" user login to platform$/) do |type|
    @app.login.log_in
end

Then(/^I should see "([^"]*)"$/) do |status|
  case status
  when "welcome"
          @app.welcome.verify_login("welcome")
      else
          expect(@app.login).to have_toast(status)
  end
end
