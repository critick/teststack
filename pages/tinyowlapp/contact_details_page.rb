module Pages
  module TinyOwlApp
    module ContactDetailsPage
      class << self

          String @@loc_login_name_input = 'login_name_input'
          String @@loc_login_phone_input = 'login_phone_input'
          String @@loc_login_email_input = 'login_email_input'
          String @@loc_tnc_checkbox = 'tnc_checkbox'
          String @@loc_btn_next = 'btn_action_bar'
          String @@loc_back_arrow = 'iv_actionbar_left_icon'
          String @@loc_page_title = 'tv_actionbar_title'

        def fill

          @fixture =  TestData.get_fixtures("android_app")

          wait_true { exists { id(@@loc_login_name_input) } }
          id(@@loc_login_name_input).send_keys(@fixture["login_name"])

          wait_true { exists { id(@@loc_login_phone_input) } }
          id(@@loc_login_phone_input).send_keys(@fixture["login_number"])

          wait_true { exists { id(@@loc_login_email_input) } }
          id(@@loc_login_email_input).send_keys(@fixture["email"])

          #below click is to, if above email address is configured in device
          #then to escape auto complete and minimize keyboard
          id(@@loc_page_title).click()

          wait_true { exists { id(@@loc_tnc_checkbox) } }
          id(@@loc_tnc_checkbox).click()

          wait_true { exists { id(@@loc_btn_next) } }
          id(@@loc_btn_next).click()
        end

        def go_back
          wait_true { exists { id(@@loc_back_arrow) } }
          id(@@loc_back_arrow).click()
        end

      end
    end
  end
end
