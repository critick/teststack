module Pages
  module TinyOwlApp
    module HomemadePage
      class << self

          String @@loc_item_add = 'btn_add'
          String @@loc_checkout = 'subtotal_proceed'
          String @@loc_slot = 'tv_time_slot'
          String @@loc_proceed = 'cart_proceed'
          String @@loc_back_arrow = 'iv_actionbar_left_icon'

        def tap_on_hamburger
          wait_true { exists { id(@@loc_hamburgerIcon) } }
          id(@@loc_hamburgerIcon).click()
          wait_true { exists { find('Home') } }
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

        def add_item_and_checkout
          wait_true { exists { id(@@loc_item_add) } }
          id(@@loc_item_add).click()

          wait_true { exists { id(@@loc_checkout) } }
          id(@@loc_checkout).click()
        end
        def select_slot_and_proceed
          wait_true { exists { id(@@loc_slot) } }
          id(@@loc_slot).click()

          wait_true { exists { id(@@loc_proceed) } }
          id(@@loc_proceed).click()
        end
      end
    end
  end
end
