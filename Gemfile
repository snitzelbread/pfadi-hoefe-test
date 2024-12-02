source "https://rubygems.org"

ruby File.read(File.join(__dir__, ".ruby-version")).strip
gem "rails", "~> 8.0.0"
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", ">= 4.0.1"
gem "image_processing", "~> 1.2"
gem "sassc-rails"
gem "browser"
gem "devise", "~> 4.9"
gem "recaptcha", "~> 5.17"
gem "dotenv-rails", "~> 3.1"
gem "i18n"
gem "pg"
gem "bcrypt", "~> 3.1.7"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "bootsnap", require: false
gem 'bootstrap'
gem "poppler"
gem 'simple_form', '~> 5.2.0'
gem "font-awesome-sass", "~> 6.4.0"
gem "dropzonejs-rails"
# Gemfile
group :development do
  gem "web-console"
  gem "letter_opener"
end
group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "rspec-mocks"
  gem "rspec-expectations"
  gem "faker"
  gem "shoulda-matchers"
  gem "rails-controller-testing"
end
