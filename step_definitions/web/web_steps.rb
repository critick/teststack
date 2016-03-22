Given(/^I am on home page$/) do
     @web.home.load
end

When(/^I login in with "([^"]*)" and "([^"]*)"$/) do |email, password|
     @web.home.set_credentials(email,password)
     @web.home.log_in
end

When(/^I login to upgrad$/) do
     @web.home.log_in
end


Then(/^I should see "(.*?)"$/) do |status|
    case status
    when "home"
         @web.home.verify_login
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
