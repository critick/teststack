module Pages
  module App
    module LoginPage
        class << self


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
