module Pages
    module Web
        class HomePage < SitePrism::Page
          include RSpec::Matchers

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
          element :account_details,'#dropdown-menu-1', text: "My Account"
          element :my_applications,'.dropdown-menu.dropdown-menu-account>li'
          element :logout_link,'.zero-border.log-out'


          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true

          # view programs and details
          element :view_programs,'.btn.btn-danger.apply-now-button-main.view-programs-video-home.text-uppercase'
          element :entherprenurship,'.btn.btn-primary.notify-me-button.view-details-card-button.fb-ent-view-details'
          element :data_analytics,'.btn.btn-primary.notify-me-button.view-details-card-button.fb-da-view-details'
          element :digital_marketing,'.btn.btn-primary.notify-me-button.view-details-card-button.fb-dgtl-mrkt-view-details'


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

          def verify_login
              has_account_details?
          end

          def view_course(course)
              if has_view_programs?
                 view_programs.click
                 case course
                 when "entherprenurship"
                      entherprenurship.click
                 when "data_analytics"
                      data_analytics.click
                 when "digital_marketing"
                      digital_marketing.click
                 end
              end
          end


        end
    end
end
