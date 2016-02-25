module Pages
  module Central
    class HomePage < SitePrism::Page
      set_url '#login/dashboard'
      element :bank_tile,'.tile-title',:text => 'Banks'
      element :dishes_tile,'.tile-title',:text => 'Dishes'
      element :restaurants_tile,'.tile-title',:text => 'Restaurants'

      def select_banks_panel
        bank_tile.click
      end
      def select_dishes_panel
        dishes_tile.click
      end
      def select_restaurants_panel
        restaurants_tile.click
      end
      end
    end
  end
