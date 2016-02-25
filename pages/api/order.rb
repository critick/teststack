module Pages
  module API
      class Order < BaseAPI

        def initialize
          @fixture =  TestData.get_fixtures("consumer_app")
        end

        def cancel (order_id)
          order = {
                    "order_id": order_id,
                    "initiated_key": "TINYOWL",
                    "reason_key": "TO_COUPON_CODE_TECH",
                    "is_compensation_by_tinyowl": "false",
                    "cancelation_compensation_bearer": "none",
                    "cancelation_loss_responsibility": "",
                    "session_token": @fixture["session_token"]
                  }

          response = make_put_request "/omp/api/"+order_id +"/cancel",order
        end

      end
  end
end
