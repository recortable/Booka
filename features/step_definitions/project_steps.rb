Given /^a project titled "([^"]*)"$/ do |title|
  @project = FactoryGirl.create(:project, title: title)
end

Given /^the project "([^"]*)" inside line "([^"]*)"$/ do |title, booka_line|
  booka_line = BookaLine.find_by_title(booka_line)
  FactoryGirl.create(:project, title: title, booka_line: booka_line)
end