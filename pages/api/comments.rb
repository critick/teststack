include RestHelper

module Pages
  module API
      class Comments < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/comments/"
            @headers  =  {
                           "Auth-Token":   @fixture["auth_token"],
                           "sessionid":    @fixture["sessionid"],
                           "content_type": @fixture["content_type"]
                         }
            @params   =  {
                           "body":       @fixture["comment"],
                           "answerId":   @fixture["answerId"]
                         }

            super(url:     @url,
                  headers: @headers,
                  params:  @params)

        end

      def post_params(args={})
          @body        = args.fetch(:body)        if args.has_key?(:body)
          @answerId    = args.fetch(:answerId)    if args.has_key?(:answerId)

          @params.merge! (args)
      end

     end
  end
end
