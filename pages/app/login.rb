module Pages
  module App
    module LoginPage
      class << self

        String @@login_email    = 'actv_email'
        String @@login_password = 'et_password'
        String @@login_button   = 'btn_login'


        def app_permission
          $driver.alert_accept
        end

        def load_login
          wait_true { exists { id(@@login_email) } }
        end

        def log_in
          @fixture  = TestData.get_fixtures("student")
          @email    = @fixture["student_username"]
          @password = @fixture["student_password"]
          id(@@login_email).send_keys(@email)
          id(@@login_password).send_keys(@password)
          id(@@login_button).click
        end

      end
    end
  end
end
