include RestHelper

module Pages
  module API
      class Questions < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/questions"
            @params   =  {}
            @headers  =  {
                          "Auth-Token":   @fixture["auth_token"],
                          "sessionid":    @fixture["sessionid"]
                          }

            super(:url    => @url,
                  :headers=> @headers)
        end

        def get_params(args={})
            @owner        = args.fetch(:owner)      if args.has_key?(:owner)
            @bookmarked   = args.fetch(:bookmarked) if args.has_key?(:bookmarked)
            @page         = args.fetch(:page)       if args.has_key?(:page)
            @order_by     = args.fetch(:order_by)   if args.has_key?(:order_by)
            @pageSize     = args.fetch(:pageSize)   if args.has_key?(:pageSize)
            @context      = args.fetch(:context)    if args.has_key?(:context)
            @params.merge! (args)
        end

        def post_params(args={})
            @title   = args.fetch(:title) if args.has_key(:title)
            @owner   = args.fetch(:owner) if args.has_key(:owner)
            @params.merge! (args)
        end


     end
  end
end
