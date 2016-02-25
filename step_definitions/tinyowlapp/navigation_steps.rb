Given(/^user is on restaurant screen$/) do
    @tinyowlapp.home.load_restaurants
end

When(/^user select restaurant$/) do
  @tinyowlapp.home.tap_on_restaurant
end

When(/^select menu item and quantity$/) do
  @tinyowlapp.restaurant_menu.add_menu_item
end

When(/^taps on checkout$/) do
  @tinyowlapp.restaurant_menu.tap_on_checkout
end

When(/^fills contact details$/) do
  @tinyowlapp.contact_details.fill
end

When(/^select address to proceed$/) do
  @tinyowlapp.choose_address.select_first_address
end

Then(/^make payment screen should be displayed$/) do
  @tinyowlapp.make_payment.has_text ("Make Payment")
end

When(/^user taps on back arrow in title bar on payment screen$/) do
  @tinyowlapp.make_payment.go_back
end

When(/^user taps on back arrow in title bar on choose address screen$/) do
  @tinyowlapp.choose_address.go_back
end

When(/^user taps on back arrow in title bar on menu screen$/) do
  @tinyowlapp.restaurant_menu.go_back
end

When(/^user clear cart by hitting DISCARD$/) do
  @tinyowlapp.restaurant_menu.discard
end

Then(/^user should be on restaurant screen$/) do
  @tinyowlapp.home.has_text ("Restaurants")
end


Given(/^user is on homemade screen$/) do
    @tinyowlapp.home.load_homemade
end

When(/^user ADD item and taps on checkout$/) do
  @tinyowlapp.homemade.add_item_and_checkout
end

When(/^select delivery slot to proceed$/) do
  @tinyowlapp.homemade.select_slot_and_proceed
end

When(/^user taps on back arrow in title bar on cart$/) do
  @tinyowlapp.homemade.go_back
end

Then(/^user should be on homemade screen$/) do
  @tinyowlapp.home.has_text ("Homemade")
end


Given(/^user is on dish screen$/) do
  @tinyowlapp.home.load_dishes
end

When(/^user taps on ORDER NOW$/) do
  @tinyowlapp.home.tap_on_order_now
end

When(/^select quantity and taps on checkout$/) do
  @tinyowlapp.restaurant_menu.add_dish_menu_item
  @tinyowlapp.restaurant_menu.dish_tap_on_checkout
end

Then(/^user should be on dish screen$/) do
  @tinyowlapp.home.verify_user_is_on_dish_page
end
