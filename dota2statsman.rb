# --
# Dota 2 Statsman application
# --
require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/twitter-bootstrap'

require 'slim'
require 'coffee_script'
require 'sprockets'

# stuff in lib
require './lib/sprockets_sinatra_middleware'

# require './config/config.rb'
require 'json'
require 'open-uri'

module Dota2StatsMan
  
  def self.settings
    @settings ||= Dota2StatsMan::App.settings
  end

  class App < Sinatra::Base
    
    register Sinatra::ConfigFile
    config_file 'config/config.yml'

    register Sinatra::Twitter::Bootstrap::Assets

    set :root, File.dirname(__FILE__)
    use ::SprocketsSinatraMiddleware, :root => settings.root, :path => 'assets' 

    get '/' do
      slim :index
    end

    get '/heroes' do
      heroes = Heroe.all
      slim :heroes, :locals => {:heroes => heroes}
    end
  end
  
end

#require all models
  Dir['./models/*.rb'].each { |file| require file }

