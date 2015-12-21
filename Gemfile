source 'https://rubygems.org'

ruby '2.2.4'

gem 'rails', '~> 4.2.4'
gem 'puma'
gem 'rails_12factor', :group => :production

# Run locally using Procfile
gem 'foreman', :group => :development

# Stats, measurements, reporting
gem 'skylight', :group => :production
gem 'newrelic_rpm', :group => :production
gem 'sentry-raven', :group => :production

# DB, Query helpers
gem 'pg'
gem 'squeel', '~>1.2.3'

# Worker model
gem 'sucker_punch', '~> 1.4.0'

# DCI
gem 'playhouse', '~> 0.1.1', :github => 'enspiral/playhouse'

# Assets
gem 'sass-rails',   '~> 5.0.0'
gem 'uglifier',     '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'gaffe',        '~>1.0.2' # custom error pages
gem 'materialize-sass', '~>0.97'

# Testing, Config, Utility
group :development, :test do
  gem 'figaro'
  gem 'guard'
  gem 'guard-livereload'

  gem 'rspec-rails', '~> 3.1.0'
  gem 'factory_girl_rails', '~> 4.4.1'
  gem 'shoulda-matchers', '~> 2.6.1'
  gem 'pry',     '~> 0.9.12'
  gem 'pry-nav', '~> 0.2.3'
end

# External Auth
gem 'omniauth',               '~> 1.2.1'
gem 'omniauth-google-oauth2', '~> 0.2.4'

# has_secure_password
gem 'bcrypt', '~> 3.1.5'

# Internal Authorization
gem 'cancancan', '~> 1.8.4'

# External APIs
gem 'google-api-client', '~> 0.7.1', :require => 'google/api_client'
gem 'sendgrid'
gem 'embedly'

# Browser API provider
gem 'doorkeeper', '~> 2.1.3'
gem 'rack-cors',  '~> 0.2.9' # Allow cross origin requests
