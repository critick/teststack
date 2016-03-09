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
          @body        = args.fetch(:body)        if args.has_key?(:body)
          @questionId  = args.fetch(:questionId)  if args.has_key?(:questionId)

          @params.merge! (args)
      end

     end
  end
end
