Given(/^I am logged in  as "([^"]*)"$/) do |user|
       dir_to_yaml = 'data/testdata'
       @credentials = YAML.load_file("#{dir_to_yaml}/testdata.yaml")

       #check if not already logged in ,else goto home
       @web.login.load
       sleep(2)
       if current_url.eql?((ENV['SERVER'])+"/")
          sleep(5) #wait for all network calls to finish
          @web.login.log_in(@number,@password)
       end

       @web.home.load
       expect(@web.home).to be_displayed
end

Then(/^I should see "(.*?)"$/) do |status|
    case status
    when "home"
         expect(@web.home).to be_displayed
    else
         expect(@web.login).to have_text(status)
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
