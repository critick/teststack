# This class is for storing elements on restaurants page.
module Pages
  module Central
    module Restaurants
      class RestaurantLogsDocumentPage < SitePrism::Page
        # Button & Links

        element :link_logs_documents_page, "#nav-accordion > li:nth-child(6) > a:nth-child(1)" #Logo & Documents"
        element :update_logo_btn, "#update_logo"
        element :delete_logo, "#delete_current_logo"
        element :download_logo, "#download_logo"

        def upload_logo
          attach_file('logo', File.join(Dir.pwd,'data/testdata/restaurantlogo.jpg'))
          update_logo_btn.click
        end
      end
    end
  end
end