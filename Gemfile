source 'https://rubygems.org'
gem 'dotenv-rails'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.2'
# Use sqlite3 as the database for Active Record
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# gem 'sassc-rails' # Doesn't compile on old OS
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'
gem 'foreman'
gem 'puma'
#gem 'passenger'
#gem 'newrelic_rpm'
gem 'kaminari'
gem "chartkick"
gem "groupdate"
gem 'calculate-all'
gem "pg"
gem 'foundation-rails'
gem "font-awesome-rails"
gem "highcharts-rails"
gem 'sinatra', :require => nil
gem "sidekiq"
gem "sucker_punch"
gem "activerecord-import"
gem "progressive_render"
gem 'faker'
gem "activeuuid"
gem "oj"
gem 'rails_12factor'

group :development, :production do 
  #gem "app_perf_rpm", :git => "https://github.com/randy-girard/app_perf_rpm", :branch => "master"
  gem "app_perf_rpm", :git => "https://github.com/blasterpal/app_perf_rpm", :branch => "add_agent_disable"
  #gem "app_perf_rpm", path: "../app_perf_rpm"
end


# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'sqlite3'
  gem 'pry'
  gem 'pry-remote'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem "capistrano", "~> 3.4"
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
  gem 'capistrano-sidekiq'
  gem 'capistrano3-puma'
  gem 'capistrano-faster-assets', '~> 1.0'
end

group :test do
  gem 'simplecov', :require => false
end
