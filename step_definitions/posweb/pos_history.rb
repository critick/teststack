Then(/^I should see history page of "([^"]*)" days$/) do |count|
    expect(@posweb.history.get_history_days_count.to_s).to eq count
end

When (/^I click on history summary of a day$/) do
      day = Time.now.day.to_s
      @posweb.history.view_history_summary(day)
end

Then(/^I should see all past orders for the day$/) do
      @posweb.history.verify_history_summary
end
