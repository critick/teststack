module Pages

  module Web
    class Application
      def initialize
         @pages = {}
      end

     def vote
         @pages[:vote] ||= Pages::Web::Vote.new
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

       def vote
          @apis[:vote] ||= Pages::API::Vote.new
       end

       def result
          @apis[:result] ||= Pages::API::Result.new
       end

     end
  end
end
