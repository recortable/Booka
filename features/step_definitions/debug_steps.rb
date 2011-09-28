Then /^debug page$/ do
  puts "***************************************************************"
  puts page.body.gsub("\n", "\n            ")
  puts "***************************************************************"
end


Given /^debug sql on$/ do
  @logger = ActiveRecord::Base.logger
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

When /^debug sql off$/ do
  ActiveRecord::Base.logger = @logger if @logger
end

When /^debug booka lines$/ do
  puts "BookaLines (#{BookaLine.count})"
  BookaLine.all.each do |line|
    puts line.inspect
  end
end

When /^debug users$/ do
  puts "Users (#{User.count})"
  User.all.each do |user|
    puts user.inspect
  end
end
When /^debug projects$/ do
  puts "Projects (#{Project.count})"
  Project.all.each do |project|
    puts project.inspect
  end
end

When /^debug permissions$/ do
  puts "Permissions (#{Permission.count})"
  Permission.all.each do |permission|
    puts permission.inspect
  end
end