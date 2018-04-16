require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Habitinator
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.assets.paths << Rails.root.join('app', 'assets', 'admin', 'fonts')
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.application_name = Rails.application.class.parent

    # Devise layout
    # Use admin application layout for user profile page
    config.to_prepare do
      Devise::SessionsController.layout 'devise'
      Devise::RegistrationsController.layout proc{ user_signed_in? ? 'admin/application' : 'devise' }
      Devise::ConfirmationsController.layout 'devise'
      Devise::UnlocksController.layout 'devise'
      Devise::PasswordsController.layout 'devise'
    end
  end
end
