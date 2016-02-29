module Pages

  module Web
    class Application
      def initialize
         @pages = {}
      end

     def login
         @pages[:login] ||= Pages::Web::LoginPage.new
     end

    end
  end


  module MobileApp
     class Application

       def initialize
         @pages = {}
       end

       def home
         @pages[:home] ||= Pages::App::HomePage
       end

     end
  end


  module API
     class Application

       def initialize
          @apis = {}
       end

       def signup
          @apis[:signup] ||= Pages::API::Signup.new
       end

     end
  end
end
