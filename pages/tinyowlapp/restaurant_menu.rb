module Pages
  module TinyOwlApp
    module RestaurantMenuPage
      class << self


          String @@loc_item_add = 'ib_item_add'
          String @@loc_checkout = 'subtotal_proceed'
          String @@loc_back_arrow = 'actionview_back'
          String @@loc_btn_dish_add_item = 'item_add_layout'
          String @@loc_btn_dish_chekout = 'dish_order'


        def dish_tap_on_checkout
          wait_true { exists { id(@@loc_btn_dish_chekout) } }
          id(@@loc_btn_dish_chekout).click()
        end

        def add_dish_menu_item
          wait_true { exists { id(@@loc_btn_dish_add_item) } }
          id(@@loc_btn_dish_add_item).click()
        end

        def tap_on(text)
          wait_true { exists { find(text) } }
          find(text).click()
        end

        def has_text(text)
          wait { find_exact text }
        end

        def go_back
          wait_true { exists { id(@@loc_back_arrow) } }
          id(@@loc_back_arrow).click()
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

        def discard
          exists { button('DISCARD') } ? button('DISCARD').click() : puts('')
        end
      end
    end
  end
end
