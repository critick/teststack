module Pages
  module Central
    class LoginPage < SitePrism::Page
      set_url '/#login'
      element :number_field, '#number'
      element :password_field, '#password'
      element :submit, '.login_submit'


      def as_user (user, password)
        login user, password
      end

      private
      def login (user, password)
        number_field.set(user)
        password_field.set(password)
        submit.click
      end


    end
  end
end
