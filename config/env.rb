require 'rubygems'

#Load all the fixture and helpter files into memory
require "rspec"
require 'rspec/expectations'
$base_dir = File.expand_path(File.join(File.dirname(__FILE__), ".."))
helpers_dir  = File.join($base_dir, "helpers")
fixtures_dir  = File.join($base_dir, "fixtures")

$LOAD_PATH.unshift(helpers_dir)
$LOAD_PATH.unshift(fixtures_dir)

require 'active_support/all'
require 'rest_helper'

require 'selenium_wrapper'
#require 'test_data'
require 'require_all'

require 'appium_lib'
#require 'appium_console'
require 'rest-client'

#Use Test::Unit assertions instead of Rsepec shoulds
require 'test/unit/assertions'
World(Test::Unit::Assertions)

#Play with cookies in your tests
require 'show_me_the_cookies'
World(ShowMeTheCookies)

require 'wannabe_bool'

# Cucumber with FactoryGirl
require 'factory_girl'
World(FactoryGirl::Syntax::Methods)

#For centralised logging
require 'logger'
$LOG = Logger.new($stderr)
#Example : $LOG.debug(message)

#For Rack based APITesting
require 'rack'
require 'rack/test'
World(Rack::Test::Methods)


#For parallel execution
require 'parallel_tests'
#For Capybara and setting the default browser
require "capybara/cucumber"

require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'capybara/dsl'



#For debugging load the Pry gem
require 'pry'

#Load these direcrories path in memory
$LOAD_PATH << './pages'
$LOAD_PATH << './lib'
$LOAD_PATH << './data/fixtures'
$LOAD_PATH << './helpers'

#For the Page Objects configuration ,load all pages
require 'site_prism'
require_all 'pages'

require 'test_data'



##For the common handling api's ,load all helpers
require_all 'helpers'
#for Adding Library files during execution
require 'rest_helper'
#For SSHConnectionsrequire 'sshkit'
require 'sshkit/dsl'
require 'remote'



case ENV['APP']

  when "native"

        case ENV['OS']
          when "android"
                capabilities = Appium.load_appium_txt file: File.join(Dir.pwd+"/config/example/android", 'appium.txt')
          when "ios"
                capabilities = Appium.load_appium_txt file: File.join(Dir.pwd+"/config/example/ios", 'appium.txt')
          else
                capabilities = Appium.load_appium_txt file: File.join(Dir.pwd+"/config", 'appium.txt')
        end

        Appium::Driver.new(capabilities)
        Before  { $driver.start_driver }

         #Appium.promote_singleton_appium_methods Pages::App
         #Appium.promote_singleton_appium_methods Pages::iosApp
        After   { $driver.driver_quit }

   when "web"
        #Configuration of Capybara for web
        Capybara.register_driver :firefox do |app|
          Capybara::Selenium::Driver.new(app, :browser => :firefox)
        end

        Capybara.register_driver :chrome do |app|
          Capybara::Selenium::Driver.new(app, :browser => :chrome)
        end

        Capybara.register_driver :selenium do |app|
          profile = Selenium::WebDriver::Firefox::Profile.new
          profile['browser.cache.disk.enable'] = false
          profile['browser.cache.memory.enable'] = false
          Capybara::Selenium::Driver.new(app, browser: :firefox, profile: profile)
        end

        #ShowMeTheCookies.register_adapter(:custom_selenium_a, ShowMeTheCookies::Selenium)

        Capybara.register_driver :poltergeist do |app|
            options = { :js_errors => ENV['DEBUG'].to_b,
                        :timeout => 100,
                        :debug => ENV['DEBUG'].to_b,
                        :phantomjs_options => ['--ignore-ssl-errors=yes',
                                               '--ssl-protocol=any',
                                               '--load-images=false',
                                               '--disk-cache=false'],
                        :inspector => true,
                        :window_size => [1920, 6000]
                      }

           Capybara::Poltergeist::Driver.new(app, options)
        end

        #change here as per tests
        Capybara.configure do |config|
          case ENV['DRIVER']
               when "poltergeist"
                    config.default_driver = :poltergeist
               when "firefox"
                    config.default_driver = :firefox
                    config.page.driver.browser.manage.window.maximize
               when "chrome"
                    config.default_driver = :chrome
                    config.page.driver.browser.manage.window.maximize
               when "appium"
                    config.default_driver = :appium
               else
                    config.default_driver = :chrome
          end

          config.javascript_driver = :poltergeist
          config.run_server = false
          config.default_selector = :css
          config.default_max_wait_time = 30
          config.app_host = ENV['SERVER']

          # capybara 2.1 config options
          config.match = :prefer_exact
          config.ignore_hidden_elements = false
        end

        SitePrism.configure do |config|
          config.use_implicit_waits = true
        end


        # Settings for Appium
        APP_PATH = ''

        def absolute_app_path
          File.join(File.dirname(__FILE__), APP_PATH)
        end

        Capybara.register_driver :appium do |app| # Native App
            capabilities = {
                            :automationName => 'Appium',
                            :app => '/Users/irfan/Desktop/app1.apk',
                            :platformName => 'Android',
                            :deviceName => 'Samsung'
                            #:newCommandTimeout => '60',
                            #:uuid => ENV['ADB_SERIAL']
                            }
        Capybara::Selenium::Driver.new(app,
                                         :desired_capabilities => capabilities)
        end

    when "api"
       #nothing now
  end
