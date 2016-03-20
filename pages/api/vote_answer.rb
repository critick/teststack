include RestHelper

module Pages
  module API
      class VoteAnswer < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/answers/"+ @fixture["answerId"] +"/vote/"
            @headers  =  {
                           "Auth-Token":   @fixture["auth_token"],
                           "sessionid":    @fixture["sessionid"],
                           "content_type": @fixture["content_type"]
                         }
            @params   =  {}

            super(url:     @url,
                  headers: @headers,
                  params:  @params)

        end

      def post_params(args={})
          @pk = args.fetch(:pk) if args.has_key?(:pk)
          @params.merge! (args)
      end

     end
  end
end
