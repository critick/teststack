module Pages
    module PosWeb
        class LoginPage < SitePrism::Page
          set_url '/'
          set_url_matcher(/$/)

          # individual elements
          element :pos_number,'.form-control',visible: true
          element :pos_password,'#password',visible: true
          element :pos_login_button,'.btn.loginBtn',visible: true
          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true
          
          def log_in(number,password)
              if has_no_loading?                       # wait till loading screen appears
                 pos_number.set(number)
                 pos_password.set(password)
                 pos_login_button.click
              else
                 puts "unable to login"
              end
          end
          
          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end
        end
    end
end
