# This class is for storing elements on restaurants page.
module Pages
  module Central
    module Restaurants
      class RestaurantsPage < SitePrism::Page
        element :search_field, "#filter"
        element :add_restaurant_type_btn, '#filters_affix > div > div > div > div > div > div:nth-child(3) > div:nth-child(6)'
        element :new_restaurant_btn, '#filters_affix > div > div > div > div > div > div:nth-child(3) > div.col-sm-1.dropdown.open > ul > li:nth-child(1) > a'
        element :more_options_btn, '#page > div:nth-child(2) > div > section > div > div:nth-child(3) > div > table > tbody > tr:nth-child(1) > td:nth-child(6) > div > button'
        element :delete_option, '#delete_restaurant'
        

        def navigate_create_restaurant
          add_restaurant_type_btn.click
          new_restaurant_btn.click
        end

        def delete_restaurant
          more_options_btn.click
          delete_option.click
          page.driver.browser.switch_to.alert.accept
        end
      end
    end
  end
end