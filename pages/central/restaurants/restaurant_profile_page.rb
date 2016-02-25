module Pages
  module Central
    module Restaurants
      class RestaurantProfilePage < SitePrism::Page

        set_url '/#restaurants/{id}/profile'

        element :id_of_page, "#page"
        element :tinyowl_representative, "#tinyowl_representative_restaurant_information"
        element :city,"#city"
        #  below are 2 locators referring same thing I guess, need to check
        element :select_locality, "#s2id_locality_id"
        element :locality, "#locality"
        element :biglocality, 'Locality'
        element :address, "#address"
        element :latitude, "#latitude"
        element :longitude, "#longitude"
        element :email, "#email"
        element :save, '.submit_div #save_changes'
        element :phone_num_for_sms, '#order_info_list > div.add_new_contact_number_sms > div > div.col-md-8.col-sm-8.col-xs-8 > input.form-control.input-sm.display-inline'
        element :phone_num_for_phone, '#order_info_list > div:nth-child(10) > div.col-md-8.col-sm-8.col-xs-8 > input.form-control.input-sm.display-inline'
        #TODO: to transfer it in base class for restaurant
        element :edit_menu_btn, "#container > header > div.horizontal-menu.navbar-collapse.collapse > ul > li:nth-child(3) > a"

        element :update_status_btn, '#top_navigation > div.row > div > div > div > span.pull-right > a.btn.btn-info.btn-sm.hidden-xs'


        def fill_details (acity,alocality,alocality_name,aaddress,alatitude,alongitude,aemail,aphone_num_for_sms)
          city.select(acity)
          select_locality.click
          find_field('Locality').native.send_keys()
          find_field('Locality').native.send_keys(:return)
          locality.set(alocality_name)
          address.set(aaddress)
          latitude.set(alatitude)
          longitude.set(alongitude)
          email.set(aemail)
          phone_num_for_sms.set(aphone_num_for_sms)
          phone_num_for_phone.set(aphone_num_for_sms)
          save.click
        end
      end
    end
  end
end
