=begin
      This class is for storing elements on restaurants menu page.
      Modal Dialogs handling :
      page.driver.browser.switch_to.alert.accept
      or
      page.driver.browser.switch_to.alert.dismiss
      or
      page.driver.browser.switch_to.alert.text
      Documentation : http://stackoverflow.com/questions/6930927/how-do-i-confirm-a-javascript-popup-with-capybara
      https://code.google.com/p/selenium/wiki/RubyBindings#JavaScript_dialogs
      http://stackoverflow.com/questions/2458632/how-to-test-a-confirm-dialog-with-cucumber/5002648#comment-8214000
=end

module Pages
  module Central
    module Restaurants
      class RestaurantMenuPage < SitePrism::Page

        element :add_category_btn, "#categories > button.add_category.btn.btn-primary.btn-sm"
        element :name_of_category, "#category_name"
        element :save_category, :xpath, "//*[@id='menu']//tr//button[contains(@class,'save_category')]"
        element :save_sub_category, :xpath, "//*[@id='menu']//tr//button[contains(@class,'create_sub_category')]"
        element :add_subcategory_btn, :xpath, "//*[@id='categories']/descendant::button[contains(@class,'add_subcategory') ]"
        element :sub_category_field, :xpath, "//form[@id='categories']/descendant::input[contains(@id,'_sub_new_sub')]"
        element :expand_category, :xpath, "//*[@id='menu']//a"
        element :list_items_btn, :xpath, "//form[@id='categories']//button[contains(@class,'add_item')]"
        element :add_item_btn, :xpath, "//form[@id='menu_items']/button[contains(@class,'add_item_new')]"
        element :modal_view, "#myModal"
        element :item_input_name, ".item_input_name"
        element :description, 'description'
        element :available_quantity, 'available_quantity'
        element :price, "#item-modal input"
        element :save_changes_item, '#myModal > div > div > div.modal-footer > button.btn.btn-primary.save_item'#'Save changes'
        element :edit_menu_btn, '.nav-pills > li:nth-child(3) > a:nth-child(1)'#'Edit Menu'
        element :validate_menu_btn, '#cache_rebuild_blk > button.validate_restaurant.btn.btn-danger.btn-lg.pull-right'
        element :push_changes_btn, '#push_changes'

        def make_menu (category_name,sub_category_name,item_name,item_description,quantity,price)
          add_category_btn.click
          name_of_category.set(category_name)
          first(:xpath, "//*[@id='menu']//tr//button[contains(@class,'save_category')]").click # => Create
          page.has_xpath?("//*[@id='categories']/descendant::button[contains(@class,'add_subcategory')]")
          first(:xpath, "//*[@id='categories']/descendant::button[contains(@class,'add_subcategory')]").click # => Click to add sub category
          page.has_xpath?("//form[@id='categories']/descendant::input[contains(@id,'_sub_new_sub')]")
          first(:xpath, "//form[@id='categories']/descendant::input[contains(@id,'_sub_new_sub')]").native.send_keys(sub_category_name) # clicked on "+" for sub category
          page.has_xpath?("//*[@id='menu']//tr//button[contains(@class,'create_sub_category')]")
          first(:xpath, "//*[@id='menu']//tr//button[contains(@class,'create_sub_category')]").click
          sleep 10
          first(:xpath, "//*[@id='menu']//a").click
          list_items_btn.click
          add_item_btn.click
          page.has_css?("#myModal",visible: true)
          sleep 3
          within("#myModal") do
            page.has_no_css?('#loading-message',visible: true)
            item_input_name.set(item_name)
            fill_in('description',:with =>item_description)
            fill_in('available_quantity',:with => quantity)
            first('#item-modal input').native.send_keys(price)
            find("#myModal > div > div > div.modal-footer > button.btn.btn-primary.save_item").click
          end
        end
      end
    end
  end
end
