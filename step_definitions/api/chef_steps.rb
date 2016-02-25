Given(/^chef details are provided$/) do

end

When(/^chef api requested to "([^"]*)" chef$/) do |operation|
    if operation.eql?('add')
      @response = @api.chef.add_chef
    elsif operation.eql?('edit')
      @response = @api.chef.edit_chef
    end
end

Then(/^the response status code should be "([^"]*)" for chef api$/) do |status_code|
    expect(@api.chef.get_status_code).to eql(status_code.to_i)
end

Then(/^new chef should created$/) do
    chef_id = @response["payload"]["id"]
    chef_status = @response["payload"]["status"]

    expect(chef_status).to eql("active")
    expect(chef_id).to be > 0
end

Then(/^chef should be updated$/) do
    chef_id = @response["meta"]["id"]
    chef_status = @response["payload"]["status"]

    expect(chef_status).to eql("active")
    expect(chef_id).to be > 0
end
