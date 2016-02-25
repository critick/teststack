module Pages
  module TinyOwlApp
    module MakePaymentPage
      class << self

          String @@loc_back_arrow = 'iv_actionbar_left_icon'

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
      end
    end
  end
end
