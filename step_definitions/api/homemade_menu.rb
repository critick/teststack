When(/^User request for "([^"]*)" menu with (\d+) and timings as (\d+) to (\d+)$/) do |restaurant_id,locality_id,slot_start_time,slot_end_time|
  @response = @api.homemade_menu.request_homemade_menu_details(restaurant_id,locality_id,slot_start_time,slot_end_time)
end

Then(/^Menu contains list of keys$/) do |table|
     expect(@api.homemade_menu.get_status_code).to eql(200)
     table.map_headers! {|header| header.downcase.to_sym }
     table.hashes.each do |row|
       expect(@api.homemade_menu.get_homemade_menu_details(row[:menu_categories])).not_to be_empty
     end
end


When(/^User sends a request to create a new item$/) do

  r = rand(100...9999)
  @new_item_name = "TEST_CREATE_NEW_ITEM_" + r.to_s
  @api.homemade_menu.request_create_new_item(@new_item_name)
end

Then(/^the response status code should be "([^"]*)" for new item$/) do |code|
    expect(@api.homemade_menu.get_status_code).to eql(code.to_i)
    expect(@api.homemade_menu.get_response_data["payload"]["name"]).to eql(@new_item_name)
    puts "New item name has been created : " +@api.homemade_menu.get_response_data["payload"]["name"]
end


When(/^User updates the existing item$/) do
    r = rand(100...9999)
    @item_name = 'TEST_UPDATE_EXISTING_ITEM_' + r.to_s
    @api.homemade_menu.request_update_existing_item(@item_name)
end

Then(/^The response status code should be "([^"]*)" for item update$/) do |code|
    expect(@api.homemade_menu.get_status_code).to eql(code.to_i)
    expect(@api.homemade_menu.get_response_data["payload"]["name"]).to eql(@item_name)
    puts "Item name has been updated to : " +@api.homemade_menu.get_response_data["payload"]["name"]

end
