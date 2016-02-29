module Pages
  module App
    module HomePage
        class << self

          def verify_login(header_text)
              $driver.id('actionview_title').text.eql?header_text
          end

       end
  end
 end
end
