include RestHelper

module Pages
  module API
      class VoteQuestion < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/questions/"+ @fixture["questionId"] +"/vote/"
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

     end
  end
end
