When(/^"([^"]*)" user request for questions$/) do |user_type|
    #@api.questions.get_params(:owner => "me")
    @api.questions.get_response
end

Then(/^questions responds with "([^"]*)"$/) do |status_code|
    expect(@api.questions.response_status).to eql(status_code.to_i)
end

Given(/^"([^"]*)" user request for creating questions$/) do |arg1|
      @api.questions.post_params(owner: "me" ,title: "sample")
      @api.questions.get_response
end


Then(/^the response is a list containing (d+) (.*?)s?$/) do |count, type|
  data = MultiJson.load(last_response.body)
  validate_list(data, of: type, count: count)
end 

Then(/(d+) (?:.*?) ha(?:s|ve) the keys:$/) do |count, table|
  expected_item = table.hashes.each_with_object({}) do |row, hash|
    name, value, type = row["attribute"], row["value"], row["type"]
    hash[name.tr(" ", "_").camelize(:lower)] = value.to_type(type.constantize)
  end
  data = MultiJson.load(last_response.body)
  matched_items = data.select { |item| item == expected_item }
  expect(matched_items.count).to eq(count)
end


#add to pages or new model

def validate_list(data, of: nil, count: nil)
  expect(data).to be_a_kind_of(Array)
  expect(data.count).to eq(count) unless count.nil?
  unless of.nil?
    validate_item = "validate_#{of.singularize.downcase.tr(' ', '_')}".to_sym
    data.each { |item| send(validate_item, item) }
  end
end

def validate_user(data) #change ,add to base
  expect(data["user"]).to be_a_kind_of(String)
  expect(data["user"]).to match(/^(new|existing|current|invalid)$/i)
end
