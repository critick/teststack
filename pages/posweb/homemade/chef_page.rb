require_relative '../../../config/env.rb'
module Pages
    module PosWeb
          class ChefPage < SitePrism::Page


            #set_url '/#chefs'
            # individual elements
            element  :neworders_button,'#newOrders'
            element :add_new_chef, 'button', :text => 'Add new Chef'
            element :chef_name, 'input[name="name"]'
            element :contact_number, 'input[name="contact_number"]'
            element :email, 'input[name="email"]'
            element :address, 'textarea[name="address"]'
            element :about, 'textarea[name="about"]'
            element :latitude, 'input[name="latitude"]'
            element :longitude, 'input[name="longitude"]'
            element :save_chef, 'button', :text => 'Save'
            element :edit_chef, :xpath,'//div[@id="addChefContainer"]/div[@class="panel chef-listing-card"][1]/div/div/div[2]/div/div/span[@class="editChef pull-right"]'

            def click_on_add_new_chef
              add_new_chef.click
            end
            def click_on_edit_chef
              edit_chef.click
            end
            def save_chef_details
              save_chef.click
            end
            def fill_in_new_chef_details

              attach_file('chef_photo', $base_dir + '/data/testdata/chef.jpg')
              name = "New Chef "+[*('A'..'Z')].sample(8).join
              chef_name.set(name)
              contact_number.set('123456')
              email.set('developer@tinyowl.co.in')
              address.set('TinyOwl 102, Supreme business park, powai , 400078')
              about.set('This is about of new chef of homemade restaurant.')
              latitude.set('19')
              longitude.set('78')
              name
            end
            def update_chef_details
              about.set('This is update of new chef of homemade restaurant.')
            end
            def accept_browser_dialog
              wait = Selenium::WebDriver::Wait.new(:timeout => 30)
              wait.until {
                begin
                  page.driver.browser.switch_to.alert
                  true
                rescue Selenium::WebDriver::Error::NoAlertPresentError
                  false
                end
              }
              message = page.driver.browser.switch_to.alert.text
              page.driver.browser.switch_to.alert.accept
              message
            end
            def is_chef_present (name)
                params= {
                          "session_token":"290233UmADHMv44w05f7AqNZAYlK8BVslrMN8ZgKylPAKnA7IzbE4wNd7Kp4Rdd053yZ8qGP1mBsDNDSijRdqNkEzwqgNN",
                        }
                response = RestClient.get "http://api-release.tinyowl.com/restaurant/chefs",{:params=>params}
                response_data = JSON.parse(response.body)
                response_data['payload'].each do |chef|
                   if chef["name"] == name
                     return true
                   end
                end
                return false
            end
      end
    end
  end
