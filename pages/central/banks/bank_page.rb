module Pages
  module Central

    module Banks
      class BankPage < SitePrism::Page

        set_url '#banks_panel/'

        element :new_button, '#new', :text => 'Create New'
        element :name, '#name'
        element :code, '#code'
        element :save_update_button, '#store'
        element :edit, '.btn-link'

        @@bank_name =('a'..'z').to_a.shuffle[0, 8].join
        @@bank_code = [*('a'..'z'), *('0'..'9')].shuffle[0, 8].join

        def create_new_bank
          new_button.click


          name.set('TestBank'+ @@bank_name.to_s)
          code.set(@@bank_code.to_s)

          save_update_button.click

        end

        def edit_bank (bank_name_to_edit)

          name.set(bank_name_to_edit)
          name.native.send_keys :enter

          assert_text(bank_name_to_edit)

          edit.click
          bank_name = name.value + '_' + @@bank_name.to_s

          name.set(bank_name)
          code.set(code.value + '_' +@@bank_code.to_s)

          save_update_button.click

        end
      end
    end
  end

end
