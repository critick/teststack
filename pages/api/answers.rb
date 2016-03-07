include RestHelper

module Pages
  module API
      class Answers < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/answers/"
            @headers  =  {
                          "Auth-Token":  @fixture["auth_token"],
                          "sessionid":   @fixture["sessionid"]
                          }

            super(:url => @url,
                  :headers=> @headers)
        end

      def set_params(args={})
          @owner        = args.fetch(:owner)
          @bookmarked   = args.fetch(:bookmarked)
          @page         = args.fetch(:page)
          @order_by     = args.fetch(:order_by)
          @pageSize     = args.fetch(:pageSize)
          @context      = args.fetch(:context) #context json
          @params.merge! (args)
      end

     end
  end
end
