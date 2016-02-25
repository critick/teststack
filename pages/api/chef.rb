module Pages
  module API
      class Chef < BaseAPI

        def initialize
          @fixture =  TestData.get_fixtures("chef_details")
        end

        def add_chef

          filename = $base_dir + "/data/testdata/chef.jpg"
          name = "New Chef "+[*('A'..'Z')].sample(8).join

          payload = { :edit => false,
                      :name => name,
                      :contact_number => @fixture["contact_number"],
                      :email => @fixture["email"],
                      :address => @fixture["address"],
                      :latitude => @fixture["latitude"],
                      :longitude => @fixture["longitude"],
                      :about => @fixture["about"],
                      :image => File.new(filename , 'rb'),
                      :multipart => true
                    }

          header =  {
                      :cookies => {'_tinyowl_session' => @fixture["tinyowl_session"]}
                    }

          response = make_post_request_with_payload '/restaurant/chefs', payload, header

          @status_code = response.code
          @response_data = JSON.parse(response.body)
        end
        def edit_chef

          name = "New Chef "+[*('A'..'Z')].sample(8).join
          payload = { :edit => false,
                      :name => name,
                      :contact_number => @fixture["contact_number"],
                      :email => @fixture["email"],
                      :address => @fixture["address"],
                      :latitude => @fixture["latitude"],
                      :longitude => @fixture["longitude"],
                      :about => @fixture["about"],
                      :id =>@fixture["id"],
                      :multipart => true
                    }

          header =  {
                      :cookies => {'_tinyowl_session' => @fixture["tinyowl_session"]}
                    }

          response = make_put_request_with_payload '/restaurant/chefs/'+@fixture["id"].to_s, payload, header

          @status_code = response.code
          @response_data = JSON.parse(response.body)
        end
        def get_status_code
          @status_code
        end
      end
   end
 end
