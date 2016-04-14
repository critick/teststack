module Pages
    module WebApp
        class LoginPage < SitePrism::Page

          set_url '/'
          set_url_matcher(/$/)

          attr_accessor  :email, :password

          def initialize(args = {})
              @fixture   =  TestData.get_fixtures("web")
              @email     =  @fixture["email"]
              @password  =  @fixture["password"]
          end


          # individual elements
          element :user_name,'#username',visible: true
          element :user_password,'#password',visible: true
          element :user_login_button,'#login',visible: true
          element :forgot_password,'.text-center.forgot-password>a',visible: true
          element :confirmation_instructions,'.confirmation-instruction>a'

          element :error_toast,'.errorToast'
          element :loading,'.body-loading-state',visible: true


          def log_in
              if has_no_loading?
                 user_name.set(email)
                 user_password.set(password)
                 user_login_button.click
              else
                 raise "unable to login"
              end
          end

          def verify_login
              has_account_details?
          end

          def set_credentials(email,password)
              email     = @fixture["email"]
              password  = @fixture["password"]
          end

          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end

          def wait_for_page_load
              has_no_loading?
          end

        end
    end
end
