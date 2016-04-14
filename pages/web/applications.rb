module Pages
    module Web
        class Applications < SitePrism::Page
          include RSpec::Matchers

          set_url '/applications/'
          #set_url_matcher(/applications$/)


          element :account_details,'#dropdown-menu-1', text: "My Account"
          element :upgrad_logo,'.navbar-brand>img'
          element :all_filter,'#dashboard-all-tab>a'
          element :previous_filter,'#dashboard-previous-tab>a'
          element :current_filter,'#dashboard-current-tab>a'
          element :logout_link,'.zero-border.log-out'

          element :view_application,'n.btn-primary.view-details-card-button.dashboard-card-main-button.view-application'
          element :view_entrepreneurship,'.btn.btn-primary.view-details-card-button.dashboard-card-main-button.view-application',visible: true
          element :view_data_analytcs,'.btn.btn-primary.notify-me-button.view-details-card-button.dashboard-card-main-button.view-application',visible: true

          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true

          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end

          def verify_login
              has_account_details?
          end

          def view_application(course)
                 case course
                 when "entrepreneurship"
                      view_entrepreneurship.click
                 when "data_analytics"
                      view_data_analytics.click
                 when "digital_marketing"
                      view_digital_marketing.click
                 end
          end

        end
    end
end
