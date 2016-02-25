# This class is for storing elements on restaurants-delivery areas page. Ideally each page should have a SitePrism class
module Pages
  module Central
    module Restaurants
      class RestaurantDeliveryAreasPage < SitePrism::Page
        set_url '#restaurants/{id}/deliveryArea'
        element :link_to_delivery_areas,'#nav-accordion > li:nth-child(3) > a:nth-child(1)'#delivery Areas link
        element :add_delivery_area_btn, "#delivery_area_form > button" # Add Delivery Area btn
        element :save_changes_btn, "#save_changes_locality"
        element :add_delivery_timing_btn, "#delivery_timings_div > button"
        # Big Locality related
        element :locality_dropdown, "#s2id_locality_filter > a"
        element :locality_dropdown_input_textbox, :xpath, "//div[@class='select2-search']/descendant::input[starts-with(@id, 's2id_autogen')]"
        element :desired_locality_from_list, :xpath, "//*[starts-with(@id,'select2-result-label')]"

        # Sub Locality Related
        element :sub_locality_dropdown, :xpath, "//div[starts-with(@id,'s2id_locality_id')]"
        element :add_1_sub_locality_dropdown_input_textbox, :xpath, "//div[@class='select2-search']/descendant::input[starts-with(@id, 's2id_autogen')]"

        # MDA/Delivery time & Delivery amount
        element :add_1_min_delivery_amount, :xpath, "//*[@id='delivery_area_form']/table/thead/tr[2]/td[2]/input"
        element :add_1_delivery_charges, :xpath, "//*[@id='delivery_area_form']/table/thead/tr[2]/td[3]/input"
        element :add_1_delivery_time, :xpath, "//*[@id='delivery_area_form']/table/thead/tr[2]/td[4]/input"
#s2id_autogen1298_search
#s2id_autogen1380_search

        def fill_delivery_areas (biglocality,sub_locality,mda,delivery_charge,delivery_time)
          locality_dropdown.click
          sleep 2
          all('input[id^="s2id_autogen"]').last.set(biglocality)
          #locality_dropdown_input_textbox.native.send_keys(@restaurant_data["biglocality"])
          desired_locality_from_list.click
          add_delivery_area_btn.click
          sub_locality_dropdown.click
          sleep 2
          all('input[id^="s2id_autogen"]').last.set(sub_locality)
          desired_locality_from_list.click
          add_1_min_delivery_amount.set(mda)
          add_1_delivery_charges.set(delivery_charge)
          add_1_delivery_time.set(delivery_time)
          save_changes_btn.click
        end
      end
    end
  end
end
