module Pages
  module TinyOwlApp
    module HomePage
      class << self

          String @@loc_type_your_location = 'btn_enter_manually'
          String @@loc_deliveryArea_search_text = 'Enter delivery area'
          String @@loc_search_result_locality_title = 'tv_locality_title'
          String @@loc_hamburgerIcon = 'iv_actionbar_left_icon'
          String @@loc_restaurant_name= 'tv_restaurant_name'
          String @@loc_item_add = 'ib_item_add'
          String @@loc_checkout = 'subtotal_proceed'
          String @@loc_btn_dish_order_now = 'btn_dish_checkout'



        def load_dishes

          wait_true { exists { id(@@loc_type_your_location) } }
          id(@@loc_type_your_location).click()

          find(@@loc_deliveryArea_search_text).send_keys("Hiranandani")
          wait_true { exists { find('Hiranandani Gardens') } }
          id(@@loc_search_result_locality_title).click();

          # valentine or any pop up if shown
          wait_true { exists { button('NOT NOW')} }
          button('NOT NOW').click()

          exists { find('Today\'s') } ? find('Today\'s').click() : find('Dishes').click()
        end

        def load_restaurants

          wait_true { exists { id(@@loc_type_your_location) } }
          id(@@loc_type_your_location).click()

          find(@@loc_deliveryArea_search_text).send_keys("Hiranandani")
          wait_true { exists { find('Hiranandani Gardens') } }
          id(@@loc_search_result_locality_title).click();

          # valentine or any pop up if shown
          wait_true { exists { button('NOT NOW')} }
          button('NOT NOW').click()

          wait_true { exists { find('Restaurants') } }
          find("Restaurants").click()
        end

        def load_homemade

          wait_true { exists { id(@@loc_type_your_location) } }
          id(@@loc_type_your_location).click()

          find(@@loc_deliveryArea_search_text).send_keys("Hiranandani")
          wait_true { exists { find('Hiranandani Gardens') } }
          id(@@loc_search_result_locality_title).click();

          # valentine or any pop up if shown
          wait_true { exists { button('NOT NOW')} }
          button('NOT NOW').click()

          wait_true { exists { find('Homemade') } }
          find("Homemade").click()
        end

        def tap_on_hamburger
          wait_true { exists { id(@@loc_hamburgerIcon) } }
          id(@@loc_hamburgerIcon).click()
          wait_true { exists { find('Home') } }
        end

        def tap_on_my_orders
          wait_true { exists { find('My Orders') } }
          find('My Orders').click()
        end

        def tap_on(text)
          wait_true { exists { find(text) } }
          find(text).click()
        end

        def has_text(text)
          wait { find_exact text }
        end

        def go_back
          wait_true { exists { id(@@loc_hamburgerIcon) } }
          id(@@loc_hamburgerIcon).click()
        end

        def tap_on_restaurant
          wait_true { exists { id(@@loc_restaurant_name) } }
          id(@@loc_restaurant_name).click()
        end
        def add_menu_item
          wait_true { exists { id(@@loc_item_add) } }
          id(@@loc_item_add).click()

        end
        def tap_on_checkout
          exists { button('DONE') } ? button('DONE').click() : puts('')
          wait_true { exists { id(@@loc_checkout) } }
          id(@@loc_checkout).click()
        end

        def tap_on_order_now
          wait_true { exists { id(@@loc_btn_dish_order_now) } }
          id(@@loc_btn_dish_order_now).click()
        end

        def verify_user_is_on_dish_page
          wait_true { exists { id(@@loc_btn_dish_order_now) } }
          exists { find('Today\'s') } ? wait_true { exists { find("Today's") } } : wait_true { exists { find("Dishes") } }

        end

      end
    end
  end
end
