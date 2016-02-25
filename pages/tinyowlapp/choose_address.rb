module Pages
  module TinyOwlApp
    module ChooseAddressPage
      class << self


          String @@loc_select_address = 'rb_address_selected'
          String @@loc_btn_proceed = 'btn_proceed'
          String @@loc_back_arrow = 'iv_actionbar_left_icon'

        def select_first_address

          wait_true { exists { find('Choose Address') } }

          wait_true { exists { id(@@loc_select_address) } }
          id(@@loc_select_address).click()

          wait_true { exists { id(@@loc_btn_proceed) } }
          id(@@loc_btn_proceed).click()

          wait_true { exists { find('Make Payment') } }
        end

        def go_back
          wait_true { exists { id(@@loc_back_arrow) } }
          id(@@loc_back_arrow).click()
        end

      end
    end
  end
end
