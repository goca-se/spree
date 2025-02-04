# By placing all of Spree's shared dependencies in this file and then loading
# it for each component's Gemfile, we can be sure that we're only testing just
# the one component of Spree.
source 'https://rubygems.org'

gem 'coffee-rails', '~> 4.2.0'
gem 'sass-rails', '~> 5.0.0'
gem 'sqlite3', '~> 1.3.13', platforms: [:ruby, :mingw, :mswin, :x64_mingw]
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw]
gem "rails-deprecated_sanitizer"
gem 'loofah', '~>2.19.1'

platforms :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcsqlite3-adapter'
end

platforms :ruby do
  gem 'pg', '~> 0.18'
end

group :test do
  gem 'capybara', '~> 2.7'
  gem 'capybara-screenshot', '~> 1.0.11'
  gem 'database_cleaner', '~> 1.5'
  gem 'email_spec'
  gem 'factory_bot_rails', '~> 4.7'
  gem 'launchy'
  gem 'rspec-activemodel-mocks', '~> 1.0.3'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-retry'
  gem 'rspec_junit_formatter'
  gem 'simplecov'
  gem 'webmock', '~> 2.1'
  gem 'poltergeist', '~> 1.10'
  gem 'timecop'
  gem 'with_model'
  gem 'rails-controller-testing'
end

group :test, :development do
  gem 'rubocop', require: false
  gem 'pry-byebug'
  gem 'webdrivers', '~> 4.0.0'
end
