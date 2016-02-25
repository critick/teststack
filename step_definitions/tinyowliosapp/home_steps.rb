Given(/^user is on restaurant page$/) do
  @tinyowliosapp.home.load
end

Given(/^user tap on hamburger$/) do
  @tinyowliosapp.home.tap_on_hamburger
end

Given(/^select My Orders$/) do
  @tinyowliosapp.home.tap_on_my_orders
end

Then(/^My Orders page should be shown$/) do
  @tinyowliosapp.home.has_text 'My Orders'
end
