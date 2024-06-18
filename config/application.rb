require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChecklistApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # POXCbM3Qaw4JQUlLeVI5zPX7WcBnX7FxiTQ3W3cNUSsOqYUSjEUIPJ/EXAMiYUJaVgBE/loVb5K6ZLe/hxruckHip0FkmJJsjqO2sNZ+tlEgmYzi4Cz3ujc3dXr7iop14O2dhwpdmDhtbEfTBipkJF0q1SuLNsySFv4suPXnEMGtOW3a5jz9kud3/SFoF5I2+V8bSj8TZkjFjFSeTUiXN0kYMiNqZequTUvTkjlv2Y6tzzq28NRMaKgfM0duQtFK0KD9lrmofNg1YKl0Tj0LoZve4rBwLr91Qh1sr2uICk3/zstYAAVi1ZYlSj4fVIVUVeEjmhM50XJ7yb7MyvqPoDrw7iHIPobIO9JyYz8kMB9queHjcg35UkKKQHCXKHGWtrv49HzuGxbKJ75C9w/1sc+BAH+u--Xo/Ghas6Oaa/Htdb--tSHPIKOG/igHr4dIBJLVxw==
    # bcc518e96f0c58110adca246642317bb
  end
end
