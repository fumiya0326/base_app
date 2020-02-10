require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module BaseApp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  config.time_zone='Tokyo'
  config.web_console.whitelisted_ips='61.125.213.102'
  config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end

