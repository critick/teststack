module Pages
  module Webproduct
    class HomePage < SitePrism::Page

      set_url ''
      element :location, '.geosuggest__input'
      element :first_location, '.geosuggest-item.geosuggest-item--active>div'
      
      element :login ,'#link-login'

      def is_location_text_visible
          location.visible?
      end
      
      def type_location
          location.set('1st Block Koramangala')
          has_text?('1st Block Koramangala', wait: 10)
      end

      def select_first_location
          first_location.click
          has_text?('Best Dishes. Best Prices.', wait: 10)
      end

      def type_locality (locality)
          location.set(locality)
          has_text?(locality, wait: 10)
          first_location.click
      end
    end
  end
end
