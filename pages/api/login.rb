include RestHelper

module Pages
  module API
      class Login < BaseAPI

        def initialize
            @fixture  =  TestData.get_fixtures("discuss")
            @url      =  "/apis/login"
            @params   =  {
                          "username":  @fixture["username"],
                          "password":  @fixture["password"],
                          "sessionid": @fixture["sessionid"]
                         }
            @headers  =  {
                          "content_type": @fixture["content_type"]
                         }

            super(url:     @url,
                  params:  @params,
                  headers: @headers)

        end

        def set_session()
            @params.merge! ({"sessionid":  TestData.get_session_id }) #generate and set unique string
        end

        def set_credentials(username,password)
            @params.merge! ({
                             "username":  username ,
                             "password":  password
                             })
        end

        def update_credentials(user_type,pass_type)
            user_type=user_type.to_b
            pass_type=pass_type.to_b

            status = (user_type ? 1 : 0) + (pass_type ? 2 : 0)
            case status
                 when 2
                 @params.merge! ({"username": "" })
                 when 1
                 @params.merge! ({"password": "" })
                 when 0
                 @params.merge! ({"username": "" ,"password": ""})
            end
        end

     end
  end
end
