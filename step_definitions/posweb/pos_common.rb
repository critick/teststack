Given(/^I click on "([^"]*)"$/) do |section|
     #@posweb.home.load
     case section
         when "new"
               @posweb.home.view_neworders
         when "preparing"
               @posweb.home.view_preparing
         when "history"
              @posweb.home.view_history
         when "query"
              @posweb.home.view_raisequery
     end
end

Given(/^I am logged in to POS as "([^"]*)"$/) do |user|
       dir_to_yaml = 'data/testdata'
       @credentials = YAML.load_file("#{dir_to_yaml}/testdata.yaml")
       case user
       when "restaurant agent"
          @number = @credentials['restaurant_agent_number']
          @password = @credentials['restaurant_agent_password']
       when "restautant testagent"
         @number = @credentials['restaurant_test_number']
         @password = @credentials['restaurant_test_password']
       else
           $LOG.error("wrong agent :#{user}")
       end
       
       #check if not already logged in ,else goto home
       @posweb.login.load
       sleep(2)
       if current_url.eql?((ENV['SERVER'])+"/")
          sleep(5) #wait for all network calls to finish
          @posweb.login.log_in(@number,@password)
       end
       
       @posweb.home.load
       expect(@posweb.home).to be_displayed
end

Then(/^I should see "(.*?)"$/) do |status|
    case status
    when "home"
         expect(@posweb.home).to be_displayed
    else
         expect(@posweb.login).to have_text(status)
    end
    #add this to helper ,should be called only in case of Poltergeist
    if Capybara.current_driver == :poltergeist
       page.driver.network_traffic.each do |request|
           request.response_parts.uniq(&:url).each do |response|
             puts "\n request url #{response.url}: \n Status #{response.status}"
          end
       end
    end
end

When(/^I am logged in to POS for homemade as "([^"]*)"$/) do |user|
    dir_to_yaml = 'data/testdata'
    @credentials = YAML.load_file("#{dir_to_yaml}/testdata.yaml")
    case user
    when "restaurant agent"
       @number = @credentials['homemade_restaurant_agent_number']
       @password = @credentials['homemade_restaurant_agent_password']
    else
        $LOG.error("wrong agent :#{user}")
    end
    @posweb.login.load
    sleep(5) #wait for all network calls to finish
    @posweb.login.log_in(@number,@password)
    expect(@posweb.home).to be_displayed
end
