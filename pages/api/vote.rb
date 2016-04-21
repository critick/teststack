include RestHelper

module Pages
  module API
      class Vote < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("vote")
            @url      =  "http://localhost:5000"
            @params   =  {"vote":  @fixture["choice"]}
            @headers  =  {"content_type": "application/x-www-form-urlencoded"}

            super(url:@url,params: @params,headers: @headers)
        end

        def set_vote(choice)
            @params.merge! ({"vote": choice })
        end

     end
  end
end
