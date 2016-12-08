require_relative 'boot'
#require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webkaikei5
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
      config.action_dispatch.default_headers.delete 'X-Frame-Options'
      
      config.action_view.field_error_proc = proc { |html_tag, instance| html_tag }
      
      config.i18n.enforce_available_locales = true
      config.i18n.default_locale = :ja
      config.active_record.raise_in_transactional_callbacks = true
  end
end

require 'csv'
#require 'nkf