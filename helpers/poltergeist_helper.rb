#To Create a Wrapper and add Common methods to be used frequently with Poltergeist

#Eg: 1.capture network traffic
#    2.errors capture
#    3.async handling
#    4.performance stats

class PoltergeistWrapper

  Capybara.register_driver :poltergeist do |app|

      options = { :js_errors => false,
                  :timeout => 200,
                  :debug => true,
                  :phantomjs_options => ['--ignore-ssl-errors=yes',
                                         '--ssl-protocol=any',
                                         '--load-images=no',
                                         '--disk-cache=false'],
                  :inspector => true,
                  :window_size => [1920, 6000]
                 }

     Capybara::Poltergeist::Driver.new(app, options)
  end

  def log_network_calls()
       page.driver.network_traffic.each do |request|
         request.response_parts.uniq(&:url).each do |response|
            puts "\n url #{response.url}: \n status #{response.status}"
         end
      end
  end

end
