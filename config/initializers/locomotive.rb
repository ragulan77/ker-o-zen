Locomotive.configure do |config|

  # A single locomotiveCMS instance can serve one single site or many.
  config.multi_sites do |multi_sites|
    multi_sites.domain = 'treize37.com'
    multi_sites.reserved_subdomains = %w(www admin email blog webmail mail support help site sites)
  end

  # config.multi_sites = true

  # configure how many items we display in sub menu in the "Contents" section.
  # config.ui = {
  #   :latest_entries_nb => 5,
  #   :max_content_types  => 4
  # }

  # default locale (for now, only en, de, fr, pt-BR, it and nb are supported)
  config.default_locale = :fr

  # available locales suggested to "localize" a site. You will have to pick up at least one among that list.
  # config.site_locales = %w{en de fr pt-BR it nl nb es ru}

  # tell if logs are enabled. Useful for debug purpose.
  config.enable_logs = true

  # configure the e-mail address which will be shown in the DeviseMailer, NotificationMailer, ...etc
  # if you do not put the domain name in the email, LocomotiveCMS will take the default domain name depending
  # on your deployment target (server, Heroku, Bushido, ...etc)
  #
  # Ex:
  # config.mailer_sender = 'support@example.com'
  # # => 'support@heroku.com' (Heroku), 'support@bushi.do' (Bushido), 'support@example.com' (Dev) or 'support@<your_hosting_platform>' (Multi-sites)
  config.mailer_sender = ENV['MAILER_SENDER']

  # allow apps using the engine to add their own Liquid drops, variables and similar available
  # in Liquid templates, extending the assigns used while rendering.
  # follow the Dependency Injection pattern
  # config.context_assign_extensions = {}

  # add extra classes other than the defined content types among a site which will potentially used by the templatized pages.
  # config.models_for_templatization = %w(Product)

  # "Public" forms can be protected from Cross-Site Request Forgery (CSRF) attacks.
  config.csrf_protection = true

  # Rack-cache settings, mainly used for the inline resizing image module. Default options:
  # config.rack_cache = {
  #   :verbose     => true,
  #   :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"), # URI encoded in case of spaces
  #   :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
  # }
  # If you do want to disable it for good, just use the following syntax
  # config.rack_cache = false
  #
  # Note: by default, rack/cache is disabled in the Heroku platform

  # Heroku hosting parameters
  config.hosting = {
    :target     => :heroku,
    :api_key    => ENV['HEROKU_API_KEY'],
    :app_name   => ENV['HEROKU_APP_NAME']
  }

  # config.search_engine = :mongoid # :mongoid # or elasticsearch or algolia
end
