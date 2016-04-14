Given(/^I am on home page$/) do
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
    @web.home.verify_login
    @web.home.view_course(course)
    #@web.entrepreneurship.verify_title
    #expect(@web.entrepreneurship).to be_displayed
    #expect(@web.entrepreneurship).to have_text(arg1)
end


When(/^views his "([^"]*)" details/) do |course|
    @web.home.verify_login
    @web.home.view_my_applications
    expect(@web.applications).to be_displayed
    @web.applications.view_application(course)
    #expect(@web.entrepreneurship).to be_displayed #change
end


When(/^Apply to "([^"]*)"$/) do |course|
    @web.entrepreneurship.apply
    sleep 5  # url redirection is not correct first time ,change after bugfix
    #expect(@web.preview).to be_displayed
    @web.preview.verify_preview_details
end



Then(/^I should see "(.*?)"$/) do |status|
    case status
    when "home"
         @web.home.verify_login
    when "preview"
         @web.preview.verify_preview_details
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

When(/^I signup as "([^"]*)" user$/) do |arg1|
  pending
end

Then(/^I should see applicatio page$/) do
  pending
end

When(/^I register as new user$/) do
  pending
end

When(/^apply for "([^"]*)"$/) do |arg1|
  pending
end

def wait_for_page_load (page)
  expect(page).not_to have_css('#loading',visible: true)
end
