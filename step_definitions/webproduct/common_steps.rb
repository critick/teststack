

def wait_for_page_load (page)
  expect(page).not_to have_css('#loading',visible: true)
end
Given(/^User lands on the main homepage$/) do
@webproduct.home.load
@webproduct.home.is_location_text_visible
end
