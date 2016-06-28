require 'rest-client'

module RestHelper

	def make_get_request(url, params, headers)
			begin
			RestClient::Request.execute(method:  :get,
																	url:     url,
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
																	url:          url,
																	timeout:      10,
																	payload:      params,
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

	def make_delete_request(url, params, headers)
			begin
			RestClient::Request.execute(method:       :delete,
																	url:          ENV['SERVER']+url,
																	timeout:      10,
																	payload:      params.to_json,
																	headers:      headers)
			rescue => e
			e.response
		  end
	end

	def make_patch_request(url, params, headers)
			begin
			RestClient::Request.execute(method:       :patch,
																	url:          ENV['SERVER']+url,
																	timeout:      10,
																	payload:      params.to_json,
																	headers:      headers)
			rescue => e
			e.response
		  end
	end

	def log_network_calls()
			 page.driver.network_traffic.each do |request|
				 request.response_parts.uniq(&:url).each do |response|
						puts "\n url #{response.url}: \n status #{response.status}"
				 end
			end
	end

end
