require 'rest-client'
require 'wannabe_bool'

class PosSettings

  def save_pos_setings(app_status,service_status,username)

    app_status=app_status.to_b
    service_status=service_status.to_b

    status = (app_status ? 1 : 0) + (service_status ? 2 : 0) # convert status into number
    case status
        when 0
        product_status = 3
        when 1
        product_status = 2
        when 3
        product_status = 1
    end

        settings= {
                    "restaurant_id" => "55fd4d958c6d73cb8900020b",
                    "has_restaurant_app"=> app_status,
                    "is_app_service_on"=> service_status,
                    "is_tinyowls_device"=> false,
                    "automated_calls"=> true,
                    "imei_no"=> "",
                    "sim_no"=> "",
                    "username"=> username,
                    "person_name"=> "",
                    "allocation_date"=> "2015-10-22",
                    "phone_model"=> "test",
                    "product_status"=> product_status,
                    "cs_independent"=> false,
                    "session_token"=>"137222zVx9lebur0cfqjIJDzEgE4sZcvSpEzjcmAousRc6DNvf7YhJDwQwNYFEbEcg1bRMj0vZESqFIEqrIBOV7LiCJgEE"
                }

        puts settings
        settingsJSON = settings.to_json
        settingsResponse = RestClient.post "https://central-api-release.tinyowl.com/restaurant/restaurant_product/point_of_sale/55fd4d958c6d73cb8900020b", settingsJSON, :content_type => :json, :accept => :json
        settingsHash = JSON.parse settingsResponse
        puts "#{settingsHash['message']}"
   end

end



 #Calling the Settings here for testing only
 #settings = PosSettings.new
 #settings.save_pos_setings(false,false,"8806221867")
 #settings.save_pos_setings(true,true,"9999999993")
