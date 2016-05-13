source 'https://rubygems.org'

gem 'sinatra', :require => "sinatra/base"
gem 'sinatra-contrib'

gem 'sprockets'
gem 'sprockets-helpers'

gem 'active_hash'

gem 'coffee-script'
gem 'slim'
gem 'sass'
gem 'less'

group :production do
  gem 'passenger'
end

group :development do
  gem 'passenger'
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem "capistrano-bundler"
  gem "capistrano-passenger"
end
