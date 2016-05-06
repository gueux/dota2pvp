source 'https://rubygems.org'

gem 'sinatra', :require => "sinatra/base"
gem 'sinatra-twitter-bootstrap', :require => 'sinatra/twitter-bootstrap'
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
  gem 'thin'
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem "capistrano-bundler"
  gem "capistrano-passenger"
end
