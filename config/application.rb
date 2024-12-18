require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PfadiHoefe
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])
    config.assets.css_compressor = :sass
    config.i18n.default_locale = :de
    config.after_initialize do
      CalendarSyncJob.perform_later(["Abteilung", "Geburtstagsliste", "Pfadi", "Wölfli", "Biber", "Kurse"])
    end

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Bern"
    # config.eager_load_paths << Rails.root.join("extras")
    # config.after_initialize do
    #   ActionText::ContentHelper.allowed_attributes = [] if ActionText::ContentHelper.allowed_attributes.nil?
    #   ActionText::ContentHelper.allowed_attributes << "style"
    #   ActionText::ContentHelper.allowed_attributes << "controls"
    #   ActionText::ContentHelper.allowed_attributes << "poster"
    #
    #   ActionText::ContentHelper.allowed_tags << "video"
    #   ActionText::ContentHelper.allowed_tags << "audio"
    #   ActionText::ContentHelper.allowed_tags << "source"
    #   ActionText::ContentHelper.allowed_tags << "embed"
    #   ActionText::ContentHelper.allowed_tags << "iframe"
    # end
  end
end
