
When(/^user types location$/) do
  @webproduct.home.type_location
end

When(/^selects first location from autocomplete$/) do
  @webproduct.home.select_first_location
end

Then(/^dishes will be shown$/) do
  expect(page).to have_text('Best Dishes. Best Prices.')
end

When(/^user types big locality$/) do
  @webproduct.home.type_locality 'Vashi'
end

When(/^types small locality$/) do
  @webproduct.home.type_locality 'Sector 17'
end
