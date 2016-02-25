chefname=nil
Given(/^user is on Chef page$/) do
  @posweb.home.hover_on_menu
   @posweb.home.view_chefs
   expect(@posweb.home).to have_text("Add new Chef")
end

When(/^user click on "([^"]*)"$/) do |button|
  case button
      when "Add new Chef"
        sleep(2)
        @posweb.chef.click_on_add_new_chef
        expect(@posweb.chef).to have_text("Add/Edit Chef")
      when "Save"
        @posweb.chef.save_chef_details
      when "Edit Chef"
        @posweb.chef.click_on_edit_chef
        expect(@posweb.chef).to have_text("Add/Edit Chef")
      end
end

When(/^fills chef details$/) do
  chefname = @posweb.chef.fill_in_new_chef_details
end

When(/^update chef details$/) do
  @posweb.chef.update_chef_details
end
Then(/^"([^"]*)" message should be shown$/) do |message|
  a = @posweb.chef.accept_browser_dialog
  puts a
  expect(message).to match(a)
end

Then(/^new chef should be present in Chef API response$/) do
  assert_true(@posweb.chef.is_chef_present chefname)
end
