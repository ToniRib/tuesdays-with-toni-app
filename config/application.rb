require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module TuesdaysWithToniApp
  class Application < Rails::Application
    config.active_record.schema_format = :sql
    config.time_zone = 'Mountain Time (US & Canada)'
  end
end
