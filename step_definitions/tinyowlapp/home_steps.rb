Given(/^user is on restaurant page$/) do
  @tinyowlapp.home.load
end


Given(/^select My Orders$/) do
  @tinyowlapp.home.tap_on_my_orders
end

Then(/^My Orders page should be shown$/) do
  @tinyowlapp.home.has_text 'My Orders'
end
