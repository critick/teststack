When(/^user create new bank$/) do
  @central.banks.load
  wait_for_page_load @central.banks
  @central.banks.create_new_bank
end

Then(/^"([^"]*)" message should be shown on bank panel$/) do |arg|
  expect(@central.banks).to have_text(arg)
end

When(/^user edits "([^"]*)" bank$/) do |bank_name|
  @central.banks.load
  @central.banks.edit_bank bank_name
end
