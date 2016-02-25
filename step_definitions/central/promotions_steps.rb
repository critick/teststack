
When(/^I Open Promotions panel$/) do
  @central.promotions.load
  wait_for_page_load @central.promotions
  page.driver.browser.manage.window.maximize();
end

When(/^I click_Add_Button "([^"]*)"$/) do |arg1|
  @central.promotions.Click_Add_Button
end

When(/^I fill Valid Details$/) do
  @central.promotions.Create_Display_Restaurant_Type_Promotion
end

Then(/^I should able to click the button "([^"]*)"$/) do |arg1|
  @central.promotions.Click_Go_to_Promotions
  print "Display Type Promotion created Successfully"
end

When(/^I create Single Restaurant Typw Promotion$/) do
  wait_for_page_load @central.promotions
  @central.promotions.Create_Single_Restaurant_Type_Promotion
end

Then(/^I should able to click the button$/) do
  @central.promotions.Click_Go_to_Promotions
  print "Single Restaurant Type Promotion created Successfully"
end

When(/^I create Multiple Restaurant Type Promotion$/) do
  wait_for_page_load @central.promotions
  @central.promotions.Create_Promotion_With_Invalid_Time
end

Then(/^I should able to see the alert "([^"]*)"$/) do |arg1|

  expect(@central.promotions).to have_text(arg1)
end

When(/^I create Display Restaurant Type Promotion$/) do
  wait_for_page_load @central.promotions
  @central.promotions.Create_Promotion_Without_Name
end


When(/^I click_edit_button "([^"]*)"$/) do |arg1|
  @central.promotions.Edit_Promotion
end

When(/^I Create Display Type Promotion$/) do
  @central.promotions.Upload_Image
  params= {
                    "place_id":"ChIJLYufSOXH5zsRK1aMQKwb59k",
                    "width":"936",
                    "session_token":"202553PYaN7EYykefAV0dvRKWyR0o9SDibosNwd8CXFTZQ6T9ikIlEfFYuYi3FAcnr2rI0OZY92qSEsqdZiL3URk79ggYY",
                    "device_id":"1de6f62a0bc129a5",
                    "app_version":"3.5.3",
                    "platform":"ANDROID"
                }
  response = RestHelper::Resthelper.new.make_get_request "https://api-release.tinyowl.com/restaurant/api/v1/promotions", params
  response_data = JSON.parse(response.body)
  promos=nil
  response_data['promotions'].each do |promotions|
    promos=promotions
    puts promotions["promotion_name"]
    break if promotions["promotion_name"] == "Onkars Promotions Test"
  end
  assert_equal("Onkars Promotions Test", promos["promotion_name"])
end
