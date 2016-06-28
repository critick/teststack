def set_window_size(width, height)
    if    Capybara.current_driver == :selenium
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
   case ENV['APP']
        when "web"
        if  Capybara.current_session.driver.is_a?(Capybara::Poltergeist::Driver)
            Capybara.reset_sessions!
            page.driver.reset!
        end
        @web ||= Pages::Web::Application.new
        when "native"
        @app ||= Pages::App::Application.new
        when "api"
        @api ||= Pages::API::Application.new
   end
end


After do #|scenario|
      case ENV['APP']
      when "web"
           if    Capybara.current_session.driver.is_a?(Capybara::Poltergeist::Driver)
                 Capybara.current_session.driver.restart
                 Capybara.reset_sessions!
           else
                 Capybara.current_session.driver.quit
           end
      when "api"
           $LOG.debug("RESPONSE : "+@response.to_s)
      end
end

AfterStep do |scenario|
         if  Capybara.current_session.driver.is_a?(Capybara::Poltergeist::Driver)
             log_network_calls
         end
end

After('@smoke', '@ci') do |scenario|
# This will only run after steps within scenarios tagged
# with @smoke AND @ci.
  if scenario.failed?
    subject = "[Test Suite Failure] #{scenario.exception.message}"
    send_failure_email(subject)
  end

  # to tell Cucumber to quit after this scenario is done - if it failed.
  # Cucumber.wants_to_quit = true if s.failed?
end
