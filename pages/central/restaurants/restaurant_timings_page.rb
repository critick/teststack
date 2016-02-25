# This class is for storing elements on restaurants-timings page.
module Pages
  module Central
    module Restaurants
      class RestaurantTimingsPage < SitePrism::Page

        set_url "#restaurants/{id}/timings"
        # Button & Links
        element :link_to_timings, "#nav-accordion > li:nth-child(2) > a:nth-child(1)"
        element :add_operational_timing, "#operational_timings_div > button"
        element :add_item_timing, "#item_timings_div > button"
        element :add_delivery_timing, "#delivery_timings_div > button"
        element :save_changes_timings, "#save_changes_timings"
        element :add_1_operational_start_time, "#timing_start_3_0"
        element :add_1_operational_end_time, "#timing_end_3_0"
        element :add_1_item_start_time, "#timing_start_1_0"
        element :add_1_item_end_time, "#timing_end_1_0"
        element :add_1_delivery_start_time, "#timing_start_4_0"
        element :add_1_delivery_end_time, "#timing_end_4_0"
        element :days_operational, :xpath, "//div[@id='operational_timings_div']/descendant::input[starts-with(@id,'s2id_autogen')]"
        element :days_delivery, :xpath, "//div[@id='delivery_timings_div']/descendant::input[starts-with(@id,'s2id_autogen')]"


        def fill_timings (start_time,end_time,days)
         add_operational_timing.click
         add_1_operational_start_time.set(start_time)
         add_1_operational_end_time.set(end_time)
         days_operational.native.send_keys(days)
         days_operational.native.send_keys(:return)

         add_item_timing.click
         add_1_item_start_time.set(start_time)
         add_1_item_end_time.set(end_time)
         add_delivery_timing.click
         add_1_delivery_start_time.set(start_time)
         add_1_delivery_end_time.set(end_time)
         days_delivery.native.send_keys(days)
         days_delivery.native.send_keys(:return)

         save_changes_timings.click
        end
      end
    end
  end
end
