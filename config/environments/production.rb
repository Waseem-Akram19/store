require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.enable_reloading = false
  config.eager_load = true

  config.consider_all_requests_local = false

  config.action_controller.perform_caching = true

  config.public_file_server.headers = {
    "cache-control" => "public, max-age=#{1.year.to_i}"
  }

  # Active Storage
  config.active_storage.service = :local

  # SSL
  # Heroku terminates SSL before requests reach your Rails app.
  config.assume_ssl = true
  config.force_ssl = true

  # Logging
  config.log_tags = [:request_id]
  config.logger = ActiveSupport::TaggedLogging.logger(STDOUT)

  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")

  config.silence_healthcheck_path = "/up"

  config.active_support.report_deprecations = false

  # Solid Cache
  config.cache_store = :solid_cache_store

  # Solid Queue
  config.active_job.queue_adapter = :solid_queue
  config.solid_queue.connects_to = {
    database: { writing: :queue }
  }

  # Mailer
  config.action_mailer.default_url_options = {
    host: ENV.fetch("APP_HOST", "localhost")
  }

  # Internationalization
  config.i18n.fallbacks = true

  config.active_record.dump_schema_after_migration = false

  config.active_record.attributes_for_inspect = [:id]

  # Host authorization
  # We'll configure this after your Heroku app is created.
end