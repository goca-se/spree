#!/bin/sh
# Used in the sandbox rake task in Rakefile

rm -rf ./sandbox
bundle exec rails _5.0.0_ new sandbox --skip-bundle
if [ ! -d "sandbox" ]; then
  echo 'sandbox rails application failed'
  exit 1
fi

cd ./sandbox

sed -i '' '/gem.*sqlite3/d' Gemfile

cat <<RUBY >> Gemfile
gem 'spree', path: '..'
gem 'spree_auth_devise', git: 'https://github.com/goca-se/spree_auth_devise', branch: 'version-3-1-rails-5-0'

group :test, :development do
  gem 'bullet'
  gem 'pry-byebug'
  gem 'rack-mini-profiler'
end

gem "loofah", "< 2.21.0" 
gem 'sqlite3', '~> 1.3.13'
RUBY

bundle install --gemfile Gemfile
bundle exec rails g spree:auth:install
bundle exec rails g spree:install --auto-accept --user_class=Spree::User --sample=true
