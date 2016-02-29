include RestHelper

module Pages
  module API
      class Login < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/apis/login"
            @params   =  {
                          "username": @fixture["username"],
                          "password": @fixture["password"]
                         }
            super(@url, @params)
        end


        def set_session()
            @params.merge! ({"sessionid":  "x123456789" }) #generate and set unique string
        end

        def login(username,password)
            @params.merge! ({
                             "username":  username ,
                             "password":  password
                             })
        end

     end
  end
end
