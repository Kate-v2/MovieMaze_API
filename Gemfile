source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails',        '~> 5.2.2'         # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'pg',           '>= 0.18', '< 2.0' # Use postgresql as the database for Active Record
gem 'puma',         '~> 3.11'          # Use Puma as the app server

gem 'sass-rails',   '~> 5.0'           # Use SCSS for stylesheets
gem 'uglifier',     '>= 1.3.0'         # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.2'           # Use CoffeeScript for .coffee assets and views
gem 'bootsnap',     '>= 1.1.0', require: false  # Reduces boot times through caching; required in config/boot.rb

gem 'bcrypt',       '~> 3.1.7'         # Use ActiveModel has_secure_password
gem 'jbuilder',     '~> 2.5'           # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'fast_jsonapi'
gem 'faraday'
gem 'rack-cors', require: 'rack/cors'

gem 'figaro'


gem 'factory_bot_rails'
gem 'faker'

gem 'travis'

# gem 'mini_racer', platforms: :ruby   # See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'redis',       '~> 4.0'          # Use Redis adapter to run Action Cable in production
# gem 'mini_magick', '~> 4.8'          # Use ActiveStorage variant
# gem 'capistrano-rails', group: :development   # Use Capistrano for deployment

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.8'
  gem 'pry'
  gem 'simplecov'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'webmock'
  gem 'vcr'
  gem 'awesome_print'
end

group :development do
  gem 'web-console', '>= 3.3.0'              # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen',      '>= 3.0.5', '< 3.2'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby] # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
