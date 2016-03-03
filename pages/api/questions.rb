include RestHelper

module Pages
  module API
      class Questions < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/v1/questions"
            @headers  =  {
                          "Auth-Token":  @fixture["auth_token"],
                          "sessionid":   @fixture["sessionid"]
                          }
            super(:url => @url, :headers=> @headers)
        end
        

     end
  end
end
