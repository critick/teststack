
Given(/^user is on home screen$/) do
    @tinyowlapp.home.load
end

Given(/^user taps on hamburger$/) do
  @tinyowlapp.home.tap_on_hamburger
end

When(/^select various menu options$/) do


@tinyowlapp.home.tap_on_my_orders
@tinyowlapp.home.has_text 'My Orders'

@tinyowlapp.home.tap_on_hamburger
@tinyowlapp.home.tap_on 'Notifications'
@tinyowlapp.home.has_text 'Notifications'

@tinyowlapp.home.tap_on_hamburger
@tinyowlapp.home.tap_on 'My Wallet'
@tinyowlapp.home.has_text 'My Wallet'

@tinyowlapp.home.tap_on_hamburger
@tinyowlapp.home.tap_on 'Free Meals'
@tinyowlapp.home.has_text 'Free Meals'

@tinyowlapp.home.tap_on_hamburger
@tinyowlapp.home.tap_on 'Sign in'
@tinyowlapp.home.has_text 'Contact Details'

@tinyowlapp.home.go_back
@tinyowlapp.home.tap_on_hamburger
@tinyowlapp.home.tap_on 'Contact Us'
@tinyowlapp.home.has_text 'Contact Us'

end

Then(/^respeactive screens should be displayed$/) do

end


# Given(/^user is on dish screen$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When(/^user taps on ORDER NOW$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# When(/^select quantity and taps on checkout$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
#
# Then(/^user should be on dish screen$/) do
#   pending # Write code here that turns the phrase above into concrete actions
# end
