Given(/^user requested for login with "([^"]*)"$/) do |number|
     @login_response = @api.login_sms.request_login_sms(number)
end

Given (/^OTP is received on "([^"]*)" from tinyowl$/) do |number|
      @otp_message = Remote.get_otp(number)
end

When(/^OTP is sent to tinyowl$/) do
     @verify_response= @api.login_verify.request_login_verify(@otp_message,@login_response["pre_token"])
end

Then(/^login should be "([^"]*)" for "([^"]*)"$/) do |status,mobile|
    assert_not_nil(puts @verify_response["profile"]["session_token"])
    assert_equal(mobile,@verify_response["profile"]["phone_numbers"][0]["number"])
end
