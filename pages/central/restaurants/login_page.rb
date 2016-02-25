module Pages
  module Central
    module Restaurants

      class LoginPage < SitePrism::Page
        set_url "/"
        element :number, "#number"
        element :password, "#password"
      end
    end
  end
end