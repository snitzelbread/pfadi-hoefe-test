Recaptcha.configure do |config|
  config.site_key  = ENV['RECAPTCHA_SITE_KEY']
  config.secret_key = ENV['RECAPTCHA_SECRET_KEY']

  # Uncomment this line for the invisible reCAPTCHA feature (if you use it)
  # config.use_recaptcha_enterprise = true
end