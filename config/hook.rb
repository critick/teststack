def set_window_size(width, height)
    if Capybara.current_driver == :selenium
        Capybara.current_session.driver.browser.manage.window.resize_to(width, height)
    elsif Capybara.current_driver == :poltergeist
        Capybara.current_session.driver.resize(width, height)
    end
end

begin
    window_sizes = {
        :'320' => { :width => 320, :height => 480 },
        :'600' => { :width => 600, :height => 769 },
        :'770' => { :width => 770, :height => 1025 },
        :'1026' => { :width => 1026, :height => 1200 },
    }
    window_sizes.default = { :width => 1026, :height=> 1200 }
    size = window_sizes[(ENV['DEVICE'] || 'default').to_sym]
    set_window_size(size[:width], size[:height])
end


Before do |scenario|
if ENV['APP'].eql?"web"
  @posweb     ||= Pages::PosWeb::Application.new
  @posapp     ||= Pages::PosApp::Application.new
  @central    ||= Pages::Central::Application.new
  @webproduct ||= Pages::Webproduct::Application.new

  dir_to_yaml = 'data/testdata'
  @credentials = YAML.load_file("#{dir_to_yaml}/testdata.yaml")
  @datahead_number = @credentials['datahead_user_number']
  @datahead_passsword = @credentials['datahead_user_password']

  @marketinghead_user_number = @credentials['marketinghead_user_number']
  @marketinghead_user_password = @credentials['marketinghead_user_password']


  #for restaurant-creation feature :
  @user_credentials = YAML.load_file("#{dir_to_yaml}/login_data.yaml")
  @restaurant_data = YAML.load_file("#{dir_to_yaml}/rest_data.yaml")

elsif ENV['APP'].eql?"native"
  @tinyowlapp ||= Pages::TinyOwlApp::Application.new
  @tinyowliosapp ||= Pages::TinyOwliosApp::Application.new
elsif ENV['APP'].eql?"api"
  if ENV['DEBUG'].eql?"true"
    RestClient.log = 'stdout'
    $LOG.debug("STARTING API testing scenario :")
  end

  @api ||= Pages::API::Application.new
  @response = ""
end

end


After do #|scenario|
  if ENV['APP'].eql?"web"
     if Capybara.current_session.driver.is_a?(Capybara::Poltergeist::Driver)
           Capybara.current_session.driver.restart
     else
           Capybara.current_session.driver.quit
     end
   elsif ENV['APP'].eql?"api"
     if ENV['DEBUG'].eql?"true"
       $LOG.debug("RESPONSE : "+@response.to_s)
     end
  end
end



Before('@smoke, @ci') do
# This will only run before scenarios tagged
# with @smoke OR @ci.
end

After('@smoke', '@ci') do |scenario|
# This will only run after steps within scenarios tagged
# with @smoke AND @ci.
  if scenario.failed?
    subject = "[POS Test Suite Failure] #{scenario.exception.message}"
    send_failure_email(subject)
  end

  # to tell Cucumber to quit after this scenario is done - if it failed.
  # Cucumber.wants_to_quit = true if s.failed?
end

#AfterConfiguration do |config|
#  puts "Features dwell in #{config.base_dir}"
#end
