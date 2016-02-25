module Pages

  module PosWeb
    class Application
      def initialize
         @pages = {}
      end

     def login
         @pages[:login] ||= Pages::PosWeb::LoginPage.new
     end

     def home
         @pages[:home] ||= Pages::PosWeb::HomePage.new
     end

     def history
         @pages[:history] ||= Pages::PosWeb::HistoryPage.new
     end

     def query
         @pages[:query] ||= Pages::PosWeb::QueryPage.new
     end

     def chef
         @pages[:chef] ||= Pages::PosWeb::ChefPage.new
     end

    end
  end

  module PosApp
     class Application

       def initialize
          @pages = {}
       end

       def login
           @pages[:login] ||= Pages::PosApp::LoginPage
       end

       def home
          @pages[:home] ||= Pages::PosApp::HomePage
       end

     end
  end

  module Central
    class Application

        def initialize
           @pages = {}
        end

       def home
          @pages[:home] ||= Pages::Central::HomePage.new
       end

       def login
          @pages[:login] ||= Pages::Central::LoginPage.new
       end

       def banks
          @pages[:banks] ||= Pages::Central::Banks::BankPage.new
       end

       def dishes
          @pages[:dishes] ||= Pages::Central::Dishes::DishesPage.new
       end

       def new_dish
          @pages[:new_dish] ||= Pages::Central::Dishes::CreateDishPage.new
       end

      def promotions
         @pages[:promotions]||= Pages::Central::Promotions::PromotionsPage.new
      end

      def offers
        @pages[:offers]||= Pages::Central::Offers::OffersPage.new
      end

      def restaurants
        @pages[:restaurants]||= Pages::Central::Restaurants::RestaurantIndexPage.new
      end

      def home_page
        @pages[:home_page] ||= Pages::Central::Restaurants::HomePage.new
      end

      def login_page
        @pages[:login_page] ||= Pages::Central::Restaurants::LoginPage.new
      end

      def restaurants_page
        @restaurants_page ||= Pages::Central::Restaurants::RestaurantsPage.new
      end

      def restaurant_create
        @restaurant_create ||= Pages::Central::Restaurants::RestaurantCreationPage.new
      end

      def restaurant_profile
        @restaurant_profile ||= Pages::Central::Restaurants::RestaurantProfilePage.new
      end

      def delivery_areas
        @delivery_areas ||= Pages::Central::Restaurants::RestaurantDeliveryAreasPage.new
      end

      def restaurant_timings
        @restaurant_timings ||= Pages::Central::Restaurants::RestaurantTimingsPage.new
      end

      def restaurant_logo
        @restaurant_logo ||= Pages::Central::Restaurants::RestaurantLogsDocumentPage.new
      end

      def restaurant_update
        @restaurant_update ||= Pages::Central::Restaurants::RestaurantUpdateStatusPage.new
      end

      def restaurant_misc
        @restaurant_misc ||= Pages::Central::Restaurants::RestaurantsMiscellaneousPage.new
      end

      def restaurant_menu
        @restaurant_menu ||= Pages::Central::Restaurants::RestaurantMenuPage.new
      end
    end
  end

  module Webproduct
    class Application
      def initialize
         @pages = {}
      end

     def home
         @pages[:home] ||= Pages::Webproduct::HomePage.new
     end
    end
  end
  module TinyOwlApp
     class Application

       def initialize
         @pages = {}
       end

       def home
         @pages[:home] ||= Pages::TinyOwlApp::HomePage
       end

       def restaurant_menu
         @pages[:restaurant_menu] ||= Pages::TinyOwlApp::RestaurantMenuPage
       end
       def contact_details
         @pages[:contact_details] ||= Pages::TinyOwlApp::ContactDetailsPage
       end
       def choose_address
         @pages[:choose_address] ||= Pages::TinyOwlApp::ChooseAddressPage
       end

       def make_payment
         @pages[:make_payment] ||= Pages::TinyOwlApp::MakePaymentPage
       end

       def homemade
         @pages[:homemade] ||= Pages::TinyOwlApp::HomemadePage
       end

     end
  end
  module TinyOwliosApp
     class Application

       def initialize
          @pages = {}
       end

       def home
          @pages[:home] ||= Pages::TinyOwliosApp::HomePage
       end

     end
  end

  module API
     class Application

       def initialize
          @apis = {}
       end

       def tabs
          @apis[:tabs] ||= Pages::API::Tabs.new
       end

      def restaurants
          @apis[:restaurants] ||= Pages::API::Restaurants.new
       end

     def restaurant_model
         @apis[:restaurant_model] ||= Pages::API::Models::RestaurantModel.new
      end

      def place_order
          @apis[:place_order] ||= Pages::API::PlaceOrder.new
       end

       def tomoney
          @apis[:tomoney] ||= Pages::API::ToMoney.new
       end

      def menu
          @apis[:menu] ||= Pages::API::Menu.new
       end

      def login_sms
          @apis[:login_sms] ||= Pages::API::LoginSMS.new
      end

      def login_verify
          @apis[:login_verify] ||= Pages::API::LoginVerify.new
      end

      def referral
          @apis[:referral] ||= Pages::API::Referral.new
      end

      def get_address
          @apis[:get_address] ||= Pages::API::GetAddress.new
      end

      def add_address
          @apis[:add_address] ||= Pages::API::AddAddress.new
      end

      def offers
          @apis[:offers] ||= Pages::API::Offers.new
      end

      def settings
          @apis[:settings] ||= Pages::API::Settings.new
      end

      def invoice
          @apis[:invoice] ||= Pages::API::Invoice.new
      end

      def restaurant_app_action
          @apis[:restaurant_app_action] ||= Pages::API::RestaurantAppAction.new
      end

      def delivery_options
          @apis[:delivery_options] ||= Pages::API::DeliveryOptions.new
      end

      def update_restaurant
          @apis[:update_restaurant] ||= Pages::API::UpdateRestaurant.new
      end

      def homemade_menu
          @apis[:homemade_menu] ||= Pages::API::HomemadeMenu.new
      end

      def restaurant_order
          @apis[:restaurant_order] ||= Pages::API::RestaurantOrder.new
      end

      def dish_order
          @apis[:dish_order] ||= Pages::API::DishOrder.new

      end

      def create_resto_order
          @apis[:create_resto_order] ||= Pages::API::CreateRestoOrder.new
      end

      def place_resto_order
          @apis[:place_resto_order] ||= Pages::API::PlaceRestoOrder.new
      end


      def order_details
          @apis[:order_details] ||= Pages::API::OrderDetails.new
      end

      def homemade
         @apis[:homemade] ||= Pages::API::HomemadeOrder.new
      end

      def booking
         @apis[:booking] ||= Pages::API::Booking.new
      end

      def order_edit
         @apis[:order_edit] ||= Pages::API::OrderEdit.new
      end

      def tags
         @apis[:tags] ||= Pages::API::Tags.new
      end

      def chef
         @apis[:chef] ||= Pages::API::Chef.new
      end

      def moods
         @apis[:moods] ||= Pages::API::Moods.new
      end

      def greeting
         @apis[:greeting] ||= Pages::API::Greeting.new
      end

      def location
         @apis[:location] ||= Pages::API::Location.new
      end

      def restaurant_product
         @apis[:restaurant_product] ||= Pages::API::RestaurantProduct::OrdersInfo.new
      end


      def daily_menu
         @apis[:daily_menu] ||= Pages::API::DailyMenu.new
      end

      def item_details
         @apis[:item_details] ||= Pages::API::ItemDetails.new
      end

      def item_for_moods
         @apis[:item_for_moods] ||= Pages::API::ItemForMoods.new
      end

      def add_ons_for_items
         @apis[:add_ons_for_items] ||= Pages::API::AddOnsForItems.new
      end

      def pastorders
         @apis[:pastorders] ||= Pages::API::PastOrders.new
      end
      def order
         @apis[:order] ||= Pages::API::Order.new
      end
      def inventories
         @apis[:inventories] ||= Pages::API::Inventories.new
      end
     end
  end
end
