module Pages
    module Web
        class Preview < SitePrism::Page
          include RSpec::Matchers

          set_url '/programs/entrepreneurship/apply/#preview'
          #set_url_matcher(/programs\/entrepreneurship\/apply\#preview$/)

          element :status_title,'.aform-title.preview-info-tab'
          element :account_details,'#dropdown-menu-1', text: "My Account"
          element :upgrad_logo,'.navbar-brand>img'

          element :personal_details,'#headingOne', visible: true
          element :work_details,'#headingTwo', visible: true
          element :question_details,'#headingThree', visible: true

          element :error_toast,'.errorToast'
          element :loading,'#loading-message',visible: true

          def verify_preview_details()
              has_personal_details?
              has_work_details?
              has_question_details?
          end

          def verify_login
              has_account_details?
          end

          def verify_error_toast(message)
              expect(error_toast).to have_text(message)
          end


        end
    end
end
