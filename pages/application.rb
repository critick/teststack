module Pages

  module Web
    class Application
      def initialize
         @pages = {}
      end

     def login
         @pages[:login] ||= Pages::MarketingWeb::LoginPage.new
     end

    end
  end


  module MobileApp
     class Application

       def initialize
         @pages = {}
       end

       def home
         @pages[:home] ||= Pages::StudentApp::HomePage
       end

     end
  end


  module API
     class Application

       def initialize
          @apis = {}
       end

       def auth
          @apis[:auth] ||= Pages::API::Auth.new
       end

     end
  end
end