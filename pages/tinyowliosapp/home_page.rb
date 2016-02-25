module Pages
  module TinyOwliosApp
    module HomePage
      class << self

          String @@loc_deliveryArea_search_text = 'Enter delivery area'
          String @@loc_search_result_locality_title = 'com.flutterbee.tinyowl.preprod:id/tv_locality_title'
          String @@loc_hamburgerIcon = 'com.flutterbee.tinyowl.preprod:id/iv_actionbar_left_icon'

        def load
          wait_true { exists { button('Enter it manually') } }
          find("Enter it manually").click()
        #  find("Enter delivery address").click()
          find("Enter delivery address").send_keys("Hiranandani")
          wait_true { exists { find('Hiranandani Gardens') } }
          id("Hiranandani Gardens").click();
          wait_true { exists { button('ORDER NOW') } }
          button('ORDER NOW').click()
          find("Restaurants").click()
        end

        def tap_on_hamburger
          #wait_true { exists { id(@@loc_hamburgerIcon) } }
          button('Menu').click();
          wait_true { exists { find('Home') } }
        end

        def tap_on_my_orders
          wait_true { exists { find('My Orders') } }
          find('My Orders').click();
        end

        def has_text(text)
          wait { find_exact text }
        end
      end
    end
  end
end
