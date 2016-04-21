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

end
