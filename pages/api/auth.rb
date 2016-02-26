include RestHelper

module Pages
  module API
      class Auth < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/apis/signup"
            @params   =  {
                          "data": {
                                  "firstname":   @fixture["firstname"],
                                  "lastname":    @fixture["lastname"],
                                  "email":       @fixture["email"],
                                  "phoneNumber": @fixture["phoneNumber"],
                                  "password":    @fixture["password"]
                                 }
                           }
            super(@url, @params)
        end


        def signup(firstname, lastname ,email ,phone)
            @params.merge! ({
                             "data":{
                                     "firstname":   username,
                                     "lastname":    lastname,
                                     "email":       email,
                                     "phoneNumber": phoneNumber
                                    }
                            })
        end

     end
  end
end
