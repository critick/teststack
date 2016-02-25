module Pages
  module PosApp
    module LoginPage
        class << self
                
          #pos_number         = $driver.id('username')
          #pos_password       = $driver.id('password')
          #pos_login_button   = $driver.id('login_button')
          #pos_app_permission = $driver.alert_accept
              
          def app_permission
              $driver.alert_accept
          end
               
          def log_in(username,password)
              $driver.id('username').send_keys(username)
              $driver.id('password').send_keys(password)
              $driver.id('login_button').click
          end
       
       end
  end
 end
end
