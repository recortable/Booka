source 'http://rubygems.org'

gem "rails", "3.1.1"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.4"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

gem 'sqlite3'
gem 'mysql2'

gem 'resque', :require => 'resque/server'  


gem 'decent_exposure'
gem 'simple_form'
gem 'css3buttons'
gem 'cancan'
gem 'omniauth'
gem 'fog'
gem 'carrierwave'
gem 'ancestry'
gem 'paper_trail'
gem 'acts_as_list'
gem 'redcarpet'
#gem 'rdiscount'
gem 'kaminari'

# Backend stuff
gem 'inherited_resources'
gem 'has_scope'


gem 'prawn'
gem 'prawnto'
gem 'nokogiri', '~> 1.4.2'

gem 'exception_notification', :require => 'exception_notifier'
gem 'newrelic_rpm'

group :test, :development do
  # Pretty printed test output
  gem 'oink'
#  gem 'mongrel', '1.2.0.pre2'
#  gem 'unicorn'
  gem 'thin'
  gem 'ruby-debug19'
#  gem 'test-unit'
  gem 'database_cleaner'
  gem 'capistrano'
  gem 'turn', :require => false
#  gem 'rails_best_practices'
  gem "rspec-rails", ">= 2.6.1"
  gem "factory_girl_rails", ">= 1.1.0", :group => :test
  gem "cucumber-rails", ">= 1.0.2", :group => :test
  gem "capybara", ">= 1.0.1", :group => :test
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem "guard-cucumber"
end
