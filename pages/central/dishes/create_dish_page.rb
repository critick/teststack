module Pages
  module Central

    module Dishes
      class CreateDishPage < SitePrism::Page

        element :res_select, '.select2-search'
        element :combo_name, '#name'
        element :total_price, '#price'
        element :serves, '#serves'
        element :signature_item, '#contains_text_1'
        element :signature_item_price, '#contains_price_1'
        element :signature_item_qty, '#contains_number_1'
        element :create_dish, 'button[type="Create"]'
        element :available_days, '#s2id_available_days'
        element :image_upload, '#image'
        element :status, :xpath, '//select[@name="dish_status"]'
        element :add_timing, '.add_dish_timing'
        element :start_timing, '#timing_start_2_0'
        element :end_timing, '#timing_end_2_0'

        def initialize
          String @restaurant = '#s2id_restaurant_id'
          String @available_days = 'div.timing_day_select'
          String @image_upload = '#image'
          String @resta_name = 'K.3 SNACKS & SWEETS'
          String @signature_item_name = 'VADA PAV(NONE) (100)'
          String @signature_item_price = '100'
        end

        def create
          time = Time.new
          dish_name='Test Combo-' +time.strftime("%Y-%m-%d %H-%M")
          combo_name.set(dish_name)
          has_text?(@resta_name, wait: 10)
          signature_item.set(@signature_item_name)
          signature_item_price.set(@signature_item_price)
          signature_item_qty.set('1')
          serves.set('2')
          add_timing.click
          start_timing.set('15:00')
          end_timing.set('20:00')

          set_available_days(
            @available_days,
            day: 'all'
          )

        create_dish.click

        end

        def edit
          select 'ACTIVE', :from => :status
          dish_name=combo_name.value + '- updated'
          combo_name.set(dish_name)
          page.driver.browser.manage.window.maximize
          total_price.click
          attach_file('image', $base_dir + '/data/testdata/dish.jpg')

          create_dish.click
        end

        def fill_autocomplete(css_id, options = {})
          @driver = page.driver.browser

          @driver.action.
              move_to(page.find("#{css_id}").native).
              click().
              send_keys(options[:with]).
              perform

          #********** select first restaurant from list **********#

          search = options[:with].upcase

          has_text?(search, wait: 10)

          search = '//ul[@class="select2-results" and ./li[contains(.,"'+search+'")]]/li[1]'


          restaurant = @driver.find_element(:xpath => search)
          @driver.action.
              click(restaurant).
              send_keys(:enter).
              perform

          @driver.action.
              move_to(page.find("#{css_id}").native).
              click().
              perform


        end

        def set_available_days (ava_id, options = {})
          @driver = page.driver.browser

          @driver.action.
              move_to(page.find("#{ava_id}").native).
              click().
              send_keys(options[:day]).
              send_keys(:enter).
              perform
        end
      end
    end
  end
end
