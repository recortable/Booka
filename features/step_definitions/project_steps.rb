Given /^a project titled "([^"]*)"$/ do |title|
  @project = FactoryGirl.create(:project, title: title)
end