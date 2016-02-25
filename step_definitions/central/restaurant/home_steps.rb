When(/^Navigating to all restaurants page$/) do
  @central.home_page.restaurants.click
end
Then(/^Search box should be displayed$/) do
  @central.restaurants_page.has_search_field?
end