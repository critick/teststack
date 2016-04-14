module Pages
    module WebApp
        class Dashboard < SitePrism::Page

          set_url '/v/dashboard'
          set_url_matcher(/v\/dashboard$/)


          # individual elements
          element :user_number,'#username',visible: true
          element :user_password,'#password',visible: true
          element :user_login_button,'#login',visible: true
          element :forgot_password,'.text-center.forgot-password>a',visible: true
          element :confirmation_instructions,'.confirmation-instruction>a'

          element :error_toast,'.errorToast'
          element :loading,'.body-loading-state',visible: true


          def verify_login
              has_account_details?
          end

          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end


        end
    end
end
