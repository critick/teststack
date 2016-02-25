module Pages
  module API
      class BaseAPI
        include RSpec::Matchers
        
        @platform = ""
        @version = ""

          def set_platform (platform)
            @platform = platform
          end

          def set_version (version)
            @version = version
            if @platform =="ANDROID"
                app_version = "3.6.8"
            else
                app_version = "1.8.1"
            end
          end

      end
  end
end
