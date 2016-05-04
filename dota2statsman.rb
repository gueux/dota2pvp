# --
# Dota 2 Statsman application
# --
require 'sinatra/base'
require 'sinatra/config_file'
require 'sinatra/twitter-bootstrap'

require 'slim'
require 'coffee_script'

# stuff for assets
#require 'sprockets'
require './lib/sprockets_sinatra_middleware'
require 'sinatra/sprockets-helpers'

# require './config/config.rb'
require 'json'
require 'active_hash'
require 'pp'

module Dota2StatsMan
  
  def self.settings
    @settings ||= Dota2StatsMan::App.settings
  end

  class App < Sinatra::Base
    
    set :root, File.dirname(__FILE__)

    register Sinatra::ConfigFile
    config_file 'config/config.yml'


    register SprocketsSinatraMiddleware::Assets
    register Sinatra::Sprockets::Helpers
    register Sinatra::Twitter::Bootstrap::Assets

    
    configure_sprockets_helpers do |helpers|
      # This will automatically configure Sprockets::Helpers based on the
      # `sprockets`, `public_folder`, `assets_prefix`, and `digest_assets`
      # settings if they exist. Otherwise you can configure as normal:
      helpers.environment = sprockets
    end
    
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

