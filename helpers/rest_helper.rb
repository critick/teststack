require 'rest-client'

module RestHelper

	def make_get_request(url, params, headers)
			begin
			RestClient::Request.execute(method:  :get,
																	url:     ENV['SERVER']+url,
																	timeout: 10,
																	headers: headers,
																	params:  params)
			rescue => e
			e.response
		  end
	end

	def make_post_request(url, params, headers)
			begin
			RestClient::Request.execute(method:       :post,
																	url:          ENV['SERVER']+url,
																	timeout:      10,
																	payload:      params.to_json,
																	headers:      headers)
			rescue => e
			e.response
		  end
	end

	def make_post(url, post_data)
			begin
			RestClient.post  ENV['SERVER']+url,post_data.to_json,:content_type => :json, :accept => :json
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

		def make_post_requests (url, params,header)
			begin
				RestClient.post ENV['SERVER']+url, params, header
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
