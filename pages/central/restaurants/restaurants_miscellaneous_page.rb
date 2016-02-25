# This class is for storing elements on restaurants-miscellaneous page.
module Pages
  module Central
    module Restaurants
      class RestaurantsMiscellaneousPage < SitePrism::Page
        set_url '/#restaurants/{id}/miscellaneous'
        # Buttons & Links
        element :link_to_miscellaneous, "#nav-accordion > li:nth-child(5) > a:nth-child(1)"
        element :save_changes_misc, "#save_changes_misc"
        #Fields
        element :add_cuisine_field, :xpath, "// label[contains(text(),'Cuisines')]/following-sibling::input"
        element :add_cuisine_inputbox, :xpath, "// label[contains(text(),'Cuisines')]/following-sibling::input"
        element :cost_for_two, "#cost_for_two"
        element :title_misc, "h3.to_center"

        def fill_misc_details(cuisine1,cuisine2,acost_for_two)
          add_cuisine_field.click
          add_cuisine_field.set('')
          add_cuisine_field.send_keys(cuisine1)
          add_cuisine_field.send_keys(:return)
          add_cuisine_field.send_keys(cuisine2)
          add_cuisine_field.send_keys(:return)
          cost_for_two.set('')
          cost_for_two.set(acost_for_two)
          cost_for_two.send_keys(:return)
          save_changes_misc.click
        end
      end
    end
  end
end
