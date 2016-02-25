Given(/^"([^"]*)" user Logs on central$/) do |user|
  @central.login.load
  case user
    when 'Marketing Head'
      @central.login.as_user @marketinghead_user_number, @marketinghead_user_password
    when 'Data Head'
      @central.login.as_user @datahead_number, @datahead_passsword
     else
  end
  wait_for_page_load @central.login
end


And(/^selects "([^"]*)" panel$/) do |panel_name|
  @central.home.load
  case panel_name
    when 'Banks'
      @central.home.select_banks_panel
    when 'Dishes'
      @central.home.select_dishes_panel
    when 'Restaurants'
      @central.home.select_restaurants_panel
    else
  end
end

def wait_for_page_load (page)
  expect(page).not_to have_css('#loading',visible: true)
end
