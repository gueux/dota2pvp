require 'sprockets'

module SprocketsSinatraMiddleware

  module Assets

    def self.registered(app)
      app.set :assets_prefix, "assets"
      app.set :sprockets, Sprockets::Environment.new(app.root).tap { |assets|
        assets.append_path "assets/stylesheets"
        assets.append_path "assets/javascripts"
        assets.append_path "assets/images"
      }

      configure_sprockets_helpers do |helpers|
        # This will automatically configure Sprockets::Helpers based on the
        # `sprockets`, `public_folder`, `assets_prefix`, and `digest_assets`
        # settings if they exist. Otherwise you can configure as normal:
        helpers.environment = sprockets.env
      end

      app.get "/#{app.assets_prefix}/*" do
        env["PATH_INFO"].sub!(%r{^/#{settings.assets_prefix}}, "")
        settings.sprockets.call(env)
      end

    end
  end

end
