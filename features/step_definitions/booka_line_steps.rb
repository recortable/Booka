
Given /^the booka line "([^"]*)"$/ do |title|
  @booka_line = FactoryGirl.create(:booka_line, title: title)
end