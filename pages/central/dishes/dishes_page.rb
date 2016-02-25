module Pages
  module Central

    module Dishes
      class DishesPage < SitePrism::Page

        #set_url '#dishes/'
      #  set_url_matcher %r{#dishes/*}
        #"a[href='#dishes/new']"
        element :new_dish,:xpath, '//a[contains(text(),"New Dish")]'
        element :edit, :xpath, '//table/tbody/tr[1]/td/a[contains(.,"Edit")]'

        def click_new_dish
          new_dish.click

        end
        def click_edit_dish
          edit.click
        end
      end

    end
  end
end
