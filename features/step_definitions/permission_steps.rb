Given /^I have "([^"]*)" permission on "([^"]*)"$/ do |level, project_title|
  project = Project.find_by_title!(project_title)
  project.permissions.create!(user:@current_user, level: level)
end