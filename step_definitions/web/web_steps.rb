Given(/^I am on home page$/) do
     binding.pry
     @web.home.load
     page.driver.reset!
     @web.home.load
end

When(/^I login in with "([^"]*)" and "([^"]*)"$/) do |email, password|
     @web.home.set_credentials(email,password)
     @web.home.log_in
end

When(/^"(.*?)" user login to upgrad$/) do |user_type|
     @web.home.log_in
end

When(/^views "([^"]*)" details$/) do |course|
    sleep 10
    binding.pry
    @web.home.view_course(course)
    expect(@web.entherprenurship).to be_displayed #change
end

When(/^Apply to "([^"]*)"$/) do |course|
    @web.entherprenurship.load
    @web.entherprenurship.apply
    sleep 5  # url redirection is not correct first time ,change after bugfix
    expect(@web.preview).to be_displayed
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
