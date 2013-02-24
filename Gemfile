source "http://bundler-api.herokuapp.com"
ruby '1.9.3'

gem 'rails', '3.2.3'
gem 'thin'
gem 'faye'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'bootstrap-sass'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'rb-fsevent', '~> 0.9.1'
  gem 'pry'
  gem 'pry-remote'
end

group :development, :test do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'cancan'
gem "bootstrap-wysihtml5-rails"
gem 'will_paginate', '~> 3.0'
gem "wice_grid", '3.2.0.pre1'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'devise'
gem 'bootstrap-sass'
gem 'formtastic'
gem 'formtastic-bootstrap'
gem 'inherited_resources'
gem 'wicked'
gem "haml-rails"
gem 'jquery-rails'
gem "meta_search",    '>= 1.1.0.pre'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'instagram'
gem "heroku"

group :test do
  gem "rspec-rails", "= 2.9"
  gem "factory_girl_rails"
  gem "capybara", ">= 1.1.1"
  gem 'faker'
end