source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.0"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
# gem "rails", "~> 7.0.5.1"
gem "rails", "~> 7.1.1"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 6.0"

# Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "jsbundling-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "cssbundling-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
# gem 'bootstrap'
gem 'whenever', require: false
gem "addressable"

gem 'spree', '= 4.7.3'
gem 'spree_backend', '= 4.7.2'
gem 'spree_frontend', '= 4.7.0'
gem 'spree_emails', '= 4.7.3'
gem 'spree_sample', '= 4.7.3'
gem 'spree_auth_devise', '~> 4.5' # Devise integration (optional)
gem 'spree_gateway', '~> 3.10' # payment gateways eg. Stripe, Braintree (optional)
gem 'spree_i18n', '~> 5.1' # translation files (optional)

gem 'spree_product_feed', github: 'matthewkennedy/spree_product_feed'

gem 'spree_sitemap', github: 'spree-contrib/spree_sitemap'

# gem 'spree_related_products', github: 'spree-contrib/spree_related_products' # not use because have error in generator and override
gem 'spree_related_products', github: 'stap780/spree_related_products' 

# gem 'spree_analytics_trackers'#, '~> 2.0'
gem 'spree_analytics_trackers', github: 'stap780/spree_analytics_trackers' # use this because it fix override js for rails 7

# gem 'spree_reviews', github: 'spree-contrib/spree_reviews' # need check Zeitwerk before use

# gem 'spree_product_import', path: '../spree_product_import'
# gem 'spree_product_import', github: 'stap780/spree_product_import'

# gem 'spree_product_bulk', path: '../spree_product_bulk'
gem 'spree_product_bulk', github: 'stap780/spree_product_bulk'

# gem 'spree_custom_cms_sections', path: '../spree_custom_cms_sections'
gem 'spree_custom_cms_sections', github: 'stap780/spree_custom_cms_sections'

gem 'spree_contact_us', github: 'stap780/spree_contact_us'
# gem 'spree_contact_us', github: 'spree-contrib/spree_contact_us'
 
# only needed for MacOS and Ruby 3.0
gem 'sassc', github: 'sass/sassc-ruby', branch: 'master'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end


group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  # gem "web-console"

  gem "capistrano", require: false
  gem "capistrano-rails", require: false
  gem 'capistrano-rvm', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma', require: false
  
  gem 'spree_cmd'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
