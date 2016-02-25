include RestHelper
module Pages
  module API
      class MagicInvoice < AppBaseAPI

          def initialize
            @fixture   =  TestData.get_fixtures("consumer_app")
            @url       =  "/api/v1/orders/invoices/"
            @params    = File.read( $base_dir + '/data/api/invoice_magic.json')
            @params    = @params.merge! ({
                              "app_version":      @fixture["app_version"],
                              "platform":         @fixture["platform"],
                              "session_token":    @fixture["session_token"],
                              "device_id":        @fixture["device_id"]
                              })
            super(@url, @params)
          end

      end
  end
end
