module Pages
  module Central
    module Restaurants
      class RestaurantUpdateStatusPage < SitePrism::Page

      element :update_status_btn, '#update_status'
      element :comment_field, 'input.form-control:nth-child(1)'

        def update_status (status,comment)
          select(status, :from =>'status_change')
          comment_field.native.send_keys(comment)
          update_status_btn.click
        end
      end
    end
  end
end
