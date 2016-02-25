
Given(/^the (\w+) number and password$/) do |type|
  @central.login_page.load
  @central.login_page.number.set(@user_credentials['number'])
  case type
    when 'incorrect'
      @central.login_page.password.set(@user_credentials['incorrect_password'])
    when 'correct'
      @central.login_page.password.set(@user_credentials['correct_password'])
  end
end

When(/^I try to login$/) do
  click_button('Submit')
  sleep 3
end

Then(/^I should not be able to login$/) do
  expect(page).to have_content('Incorrect Username/Password')
end

Then(/^I should be able to login$/) do
  expect(page).to have_content('Restaurants')
end
