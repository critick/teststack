module Pages
  module App
    module WelcomePage
      class << self

        String @@toolbar   = 'toolbar'

        def verify_login(header_text)
          wait_true { exists { id(@@toolbar) } }
          id(@@toolbar).text.eql?header_text
        end
      end
    end
  end
end
