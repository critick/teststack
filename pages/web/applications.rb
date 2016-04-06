module Pages
    module Web
        class Applications < SitePrism::Page
          include RSpec::Matchers

          set_url '/applications'
          set_url_matcher(/applications$/)


          element :account_details,'#dropdown-menu-1', text: "My Account"
          element :upgrad_logo,'.navbar-brand>img'
          element :all_filter,'#dashboard-all-tab>a'
          element :previous_filter,'#dashboard-previous-tab>a'
          element :current_filter,'#dashboard-current-tab>a'
          element :logout_link,'.zero-border.log-out'

          element :view_application,'n.btn-primary.view-details-card-button.dashboard-card-main-button.view-application'

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

          def verify_login
              has_account_details?
          end

        end
    end
end
