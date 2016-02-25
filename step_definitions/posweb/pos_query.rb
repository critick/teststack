Then(/^I should see query page with "([^"]*)" and "([^"]*)" queries$/) do |query,count|
    expect(@posweb.query.get_query_categories_count.to_s).to eq count
    @posweb.query.verify_raise_query(query)
end
