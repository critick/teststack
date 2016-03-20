module Pages
    module Web
        class HomePage < SitePrism::Page
          set_url '/'
          set_url_matcher(/$/)

          attr_accessor  :email, :password

          def initialize(args = {})
              @fixture   =  TestData.get_fixtures("web")
              @email     =  @fixture["email"]
              @password  =  @fixture["password"]
          end

          # individual elements
          element :login_link,'.track-request', text: "Login"
          element :signup_link,'.track-request', text: "Sign Up"
          element :login_email,'.login-email', visible: true
          element :login_password,'.login-pass', visible: true
          element :login_button,'.login-button-nav', visible: true
          element :forgot_password,'.forgot-password-text'

          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true

          def log_in()
              if has_login_link?
                 login_link.click
                 login_email.set(email)
                 login_password.set(password)
                 login_button.click
              else
                 puts "unable to login"
              end
          end

          def set_credentials(email,password)
              email     = @fixture["email"]
              password  = @fixture["password"]
          end

          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end
        end
    end
end
