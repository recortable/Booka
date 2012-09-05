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

#gem 'unicorn'
group :production do
  gem 'pg'
  gem 'thin'
end

group :development do
  gem 'capistrano'
  gem 'rvm-capistrano'
  gem 'thin'
  gem 'mysql2'
end

group :test do
  gem 'sqlite3'
  gem 'oink'
  gem 'database_cleaner'
  gem 'turn', :require => false
  gem "rspec-rails", ">= 2.6.1"
  gem "factory_girl_rails", ">= 1.1.0"
  gem "cucumber-rails", ">= 1.0.2"
  gem "capybara", ">= 1.0.1"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
  gem "guard-cucumber"
end
