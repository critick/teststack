require 'csv'
require 'yaml'


When (/^I load all device details from "(.*?)"$/) do |path|
   @data = []
   path ="data/pos_data/"+path
   CSV.foreach(path, headers: true) do |row|
     @data << row
   end
end

Then (/^I install "([^"]*)" from playstore$/) do |app|
      data_file = File.join("data/pos_data/playstore.yml")
      data_url  = YAML.load_file(data_file)
      
      case app
      when "ToBusiness"
           playstore_url = data_url[app]["URL"]
      when "MobizenSamsung"
           playstore_url = data_url[app]["URL"]
      else
           puts "wrong value set for app"
      end
 
      puts playstore_url
      
      @data.each do |row|
      session = Capybara::Session.new(:firefox)
         session.visit "https://gmail.com"
         device = row.to_s[-8,7]
         puts "device is tinyowldevice"+ device
         session.fill_in "Email",with: "tinyowldevice"+ device
         session.click_button "next"
         session.fill_in "Passwd",with: "tinyowladmin@"+ device
         session.click_button "signIn"
        
         session.visit playstore_url
         session.find('.price.buy.id-track-click',match: :first, visible: true).click
         begin
              session.find("#purchase-ok-button").click
         rescue Capybara::ElementNotFound => e
              puts "unable to install app on device"+ device
              next
          else
              if session.find('#close-dialog-button').text.eql?"OK"
                 puts "installation confirmation for device "+ device
              else
                 puts "no installation confirmation for device "+ device
              end
          ensure
              session.driver.quit
          end
    end
end

Given(/^I am on gmail login page$/) do
     visit "https://gmail.com"
end
