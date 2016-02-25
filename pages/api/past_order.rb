module Pages
  module API
    class PastOrders < BaseAPI

      def initialize
        @fixture =  TestData.get_fixtures("consumer_app")
      end

      attr_accessor :status_code

      def get_scheduled_orders
        body = {
          "session_token" => @fixture["session_token"],
          "device_id" => @fixture["device_id"],
          "app_version" => @fixture["app_version"],
          "platform" => @platform,

        }

        response = make_get_request "/restaurant/api/v1/scheduled_orders" ,body
        @status_code = response.code
        @response_data = JSON.parse(response.body)
      end

      def get_order_status order_id
        app_version=""

        if @platform =="ANDROID"
            app_version = "3.6.8"
        else
            app_version = "1.8.1"
        end

        body = {
          "order_id" => order_id,
          "session_token" => @fixture["session_token"],
          "device_id" => @fixture["device_id"],
          "app_version" => app_version,
          "platform" => @platform,

        }

        response = make_get_request "/restaurant/api/v1/restaurants/get_order_status" ,body
        @status_code = response.code
        @response_data = JSON.parse(response.body)
      end

      def get_past_orders
        body = {
          "session_token" => @fixture["session_token"],
          "device_id" => @fixture["device_id"],
          "app_version" => @app_version,
          "platform" => @platform,

        }

        response = make_get_request "/restaurant/api/v1/get_past_orders" ,body
        @status_code = response.code
        @response_data = JSON.parse(response.body)
      end
    end
  end
end
