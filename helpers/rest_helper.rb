require 'rest-client'

module RestHelper

			def make_post_request(url, post_data)
				begin
					RestClient.post  ENV['SERVER']+url,post_data.to_json,:content_type => :json, :accept => :json
				rescue => e
					e.response
				end
			end

  		def make_get_request(url, get_data)
					begin
	  				RestClient.get  ENV['SERVER']+url,{:params=>get_data}
				  rescue => e
						e.response
				 end
			end

			def make_get_request_with_header(url, get_data)
					begin
	  				RestClient.get  ENV['SERVER']+url,{:params=>get_data}
				  rescue => e
						e.response
				 end
			end
		def make_put_request(url, put_data)
			begin
			RestClient.put  ENV['SERVER']+url,put_data.to_json,:content_type => :json, :accept => :json
			rescue => e
				e.response
		 end
		end

		def make_post_request_with_payload (url, payload,header)
			begin
				RestClient.post ENV['SERVER']+url, payload, header
			rescue => e
				puts "handling exception"
			  e.response
			end
		end

		def make_put_request_with_payload (url, payload,header)
			begin
				RestClient.put ENV['SERVER']+url, payload, header
			rescue => e
				puts "handling exception"
				e.response
			end
		end
end
