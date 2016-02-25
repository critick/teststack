module Pages
  module Central

    module Restaurants
      class RestaurantIndexPage < SitePrism::Page
        #set_url '#restaurants/'


        element :restaurants_filter, '#filter'
element :dishes,:xpath, '//a[contains(text(),"Dishes")]'

        def search_restaurant

          restaurants_filter.set('K.3 SNACKS')
          restaurants_filter.send_keys(:enter)

        end
        def view_dishes
          dishes.click
        end
      end
end
end
end
