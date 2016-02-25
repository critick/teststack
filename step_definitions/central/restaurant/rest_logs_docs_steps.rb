Given(/^I am able to see logo field on Logs & Documents page$/) do
  @central.restaurant_profile.load(id: @restaurant_id)
  @central.restaurant_profile.tinyowl_representative
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_logo.link_logs_documents_page.click
  @central.restaurant_logo.update_logo_btn
end

When(/^I upload image file$/) do
  @central.restaurant_logo.upload_logo
  expect(page).not_to have_css('#loading-message',visible: true)
  @central.restaurant_logo.delete_logo
end

Then(/^I am able to see uploaded image$/) do
  expect(@central.restaurant_logo).to have_css('#delete_current_logo', visible: true)
end