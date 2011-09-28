Given /^I'm authenticated as "([^"]*)"$/ do |name|
  @user = User.find_or_create_by_name(name)
  visit enter_path(@user.id)
end