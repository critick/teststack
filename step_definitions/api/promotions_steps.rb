include RestHelper


When (/^User makes a Request to Promotions API with Place Id for Hiranandani$/) do

	    @url = "/restaurant/api/v1/promotions"

	     @get_request   = {
                   "place_id" => "ChIJLYufSOXH5zsRK1aMQKwb59k",
                   "platform" => "ANDROID",
                   "width" => "672",
                   "app_version"=> "3.6.6"
                  }
end

Then (/^Response should contain all the Promotion Ids$/) do
		@get_response = make_get_request(@url,@get_request)
		assert_equal(200,@get_response.code)

		@get_response = JSON.parse(make_get_request(@url,@get_request))

		expect(@get_response["promotions"].length).to be > 0
end


And (/^User gets the Promotion Names Array$/) do

		@get_response = make_get_request(@url,@get_request)
		assert_equal(200,@get_response.code)

		@get_response = JSON.parse(make_get_request(@url,@get_request))

		@promotions_arr = 	@get_response["promotions"]

		@promo_hash = Hash.new

		@promotions_arr.each do |promo|
			@promo_hash[promo["promotion_name"]]=promo["promotion_type"]
		end

		# puts @promo_hash
		expect(@promo_hash.empty?).to be false

end



Then (/^Response should contain the ([^"]*) and ([^"]*)$/) do |promotion_name,promotion_type|


		expect(@promo_hash.keys.include?(promotion_name)).to be true
		expect(@promo_hash[promotion_name]).to eq(promotion_type)
		# puts "Verify promotion name exists in Response: " +  promotion_name
		# puts promotion_name + " and " + promotion_type
end

When (/^User makes a Request to Promotions API with Place Id for Magarpatta City$/) do
 	    @url = "/restaurant/api/v1/promotions"

	     @get_request   = {
                   "place_id" => "ChIJnxdrL4vBwjsRE6jR6bFGtb4",
                   "platform" => "ANDROID",
                   "width" => "672",
                   "app_version"=> "3.6.6"
                  }
end

Then (/^Response should be \"([^\"]*)\"$/) do |msg|
  		@get_response = make_get_request(@url,@get_request)
		assert_equal(200,@get_response.code)
		@get_response = JSON.parse(make_get_request(@url,@get_request))

		assert_equal(msg,@get_response["error_message"])
end
