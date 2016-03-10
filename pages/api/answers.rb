include RestHelper

module Pages
  module API
      class Answers < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/answers/"
            @headers  =  {
                           "Auth-Token":   @fixture["auth_token"],
                           "sessionid":    @fixture["sessionid"],
                           "content_type": "application/json"
                         }
            @params   =  {
                           "body":       @fixture["answer"],
                           "questionId": @fixture["questionId"]
                         }

            super(url:     @url,
                  headers: @headers,
                  params:  @params)

        end

      def post_params(args={})
          @body        = args.fetch(:body)        if args.has_key?(:body)
          @questionId  = args.fetch(:questionId)  if args.has_key?(:questionId)

          @params.merge! (args)
      end

     end
  end
end
