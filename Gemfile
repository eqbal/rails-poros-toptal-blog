source 'https://rubygems.org'
ruby '2.1.2'
gem 'rails', '4.0.4'
gem 'sass-rails', '~> 4.0.1'
gem 'uglifier', '~> 2.4.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'jquery-rails', '~> 3.0.4'
gem 'jquery-ui-rails'
gem 'turbolinks', '~> 2.1.0'
gem 'jquery-turbolinks'
gem 'jbuilder'
gem 'bcrypt-ruby', '~> 3.1.2'

group :doc do
  gem 'sdoc', require: false
end

# development gems
group :development, :test do
  # gem 'sqlite3', '~> 1.3.8'    # dev & test database
  gem 'mysql2'
  gem 'figaro', '~> 0.7.0'     # env variables
end

# Paging
gem 'kaminari', '~> 0.15.0'

# Slugs and friendly id's
gem 'friendly_id', '~> 5.0.2'

# font-awesome
gem 'font-awesome-sass', '~> 4.0.2'

# production gems for heroku
group :production do
  gem 'pg'
end


# Devise
gem 'devise', '~> 3.2.2'


# Bootstrap 3
group :development, :test do
  gem 'rails_layout', '~> 0.5.11'  # Bootstrap 3 layout generator
  gem "factory_girl_rails"
  gem "database_cleaner", :group => :test
  gem "email_spec", :group => :test  
end

gem 'bootstrap-sass', '~> 3.0.3.0'


# RSpec
group :test, :development do
  gem "rspec-rails", '~> 2.14.1'
end

# Capybara
group :test do
  gem 'selenium-webdriver'  
  gem "capybara"    
end

gem "simple_form", ">= 2.0.4"

gem 'momentjs-rails', '~> 2.5.0'
gem 'bootstrap3-datetimepicker-rails', '~> 3.0.0'
gem 'abracadabra'
