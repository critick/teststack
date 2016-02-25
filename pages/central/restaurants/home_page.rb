# This class is for storing elements on home page. Ideally each page should have a SitePrism class
module Pages
  module Central
    module Restaurants
      class HomePage < SitePrism::Page
        element :restaurants, "#page > div > div:nth-child(1)"
      end
    end
  end
end