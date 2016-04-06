module Pages
    module Web
        class LoginPage < SitePrism::Page
          set_url '/'
          set_url_matcher(/$/)

          # individual elements
          element :user_number,'.form-control',visible: true
          element :user_password,'#password',visible: true
          element :user_login_button,'.btn.loginBtn',visible: true
          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true

          def log_in(number,password)
              
              if has_no_loading?                       # wait till loading screen appears
                 user_number.set(number)
                 user_password.set(password)
                 user_login_button.click
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
