Given(/^I am on voting page$/) do
    @web.vote.load
end

When(/^I see "([^"]*)"$/) do |title|
    #expect(@web.vote.get_title).to eql(text)
end

Then(/^I vote for "([^"]*)"$/) do |choice|
   @web.vote.set_vote(choice)
   page.save_screenshot
end
