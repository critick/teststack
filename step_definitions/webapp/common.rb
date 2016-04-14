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

# add this to helper ,should be called only in case of Poltergeist
if Capybara.current_driver == :poltergeist
   page.driver.network_traffic.each do |request|
       request.response_parts.uniq(&:url).each do |response|
         puts "\n request url #{response.url}: \n Status #{response.status}"
      end
   end
end
end
