Given(/^I am on login page$/) do
     @webapp.login.load
end

When(/^"([^"]*)" user login to platform$/) do |type|
    @webapp.login.log_in
end

Then(/^I should see "([^"]*)"$/) do |status|
     case status
     when "dashboard"
          expect(@webapp.dashboard).to be_displayed
     end
end
