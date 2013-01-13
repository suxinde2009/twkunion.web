source 'https://rubygems.org'

gem 'rails', '3.2.11'

# mongo support
gem 'mongoid',    '3.0.17'
gem 'mongoid_auto_increment'
gem 'bson_ext',   '1.8.0'
gem 'rack', '1.4.1'

# Core functions
gem 'devise',               '~> 2.2.1'
# gem 'devise_invitable',     '~> 1.0.2'
gem 'simple_form',          '~> 2.0.4'
gem 'inherited_resources',  '~> 1.3.1'
gem 'kaminari',             '~> 0.14.1'
# gem 'nested_form',          '~> 0.3.1'
gem 'symbolize',            '~> 4.2.0', require: 'symbolize/mongoid'
gem 'mongoid-ancestry',     '~> 0.3.0'
gem 'rails_config'

gem 'cells', '~> 3.8.6'

# gem 'carrierwave', '~> 0.6.0'
gem 'carrierwave-mongoid', github: 'jnicklas/carrierwave-mongoid', require: 'carrierwave/mongoid', branch: 'mongoid-3.0'
gem 'mini_magick'

gem 'mongoid_magic_counter_cache', github: 'Kequc/mongoid-magic-counter-cache'

# Full-text search support
gem 'sunspot_rails', '~> 1.3.1'
gem 'sunspot_solr','1.3.2'
gem 'sunspot_mongoid', github: 'TV4/sunspot_mongoid'

# SNS support
gem 'omniauth-weibo-oauth2',          '~> 0.2.0'
gem "omniauth-qq-connect",            '~> 0.1.0'
gem 'weibo2',                         git: 'git://github.com/fmmp3/weibo2.git'

# Exception notifier
gem 'exception_notification',  '~> 3.0.0', github: 'smartinez87/exception_notification'

# client side validations support
gem 'client_side_validations', '3.2.0'
gem 'client_side_validations-mongoid', '~> 3.0.1'
gem 'client_side_validations-simple_form', '2.0.0'

# Social Share
gem 'social-share-button', '0.0.3'

# Admin support
gem 'activeadmin', github: 'gregbell/active_admin'
gem 'activeadmin-mongoid', github: 'simplybusiness/activeadmin-mongoid', branch: 'filter_support'

# Rich text support
gem 'rails_kindeditor', '~> 0.3.10'

# uploadify support
# gem 'swf_fu', '~> 2.0'
# gem 'flash_cookie_session'
gem 'rack-raw-upload'

gem 'coffee-filter', require: 'coffee-filter'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  # gem 'libv8', '~> 3.11.8'
  gem 'uglifier', '>= 1.0.3'
end

# asset gems
gem 'haml',           '~> 3.1.4'
gem 'haml-rails',     '~> 0.3.4'
gem 'jquery-rails'    
gem 'bourbon'

gem 'unicorn'

group :development do
  # Deploy with Capistrano
  # gem 'rvm-capistrano'
  gem 'capistrano', '~> 2.11.2'
  gem 'capistrano_colors'
  gem 'rvm-capistrano'

  # colored log
  gem 'mongoid_colored_logger'
  
  # speed up dev
  gem 'rails-dev-tweaks', '~> 0.6.1'
  
  #start server with thin
  gem 'thin'
end

# For test supporting
group :development, :test do
  gem 'machinist',        '~> 2.0'
  gem 'machinist_mongo',  github: 'nmerouze/machinist_mongo', require: 'machinist/mongoid', branch: 'machinist2'
  gem 'database_cleaner', '~> 0.7.1'
  gem 'ffaker',           '~> 1.12.1'
  gem 'launchy'
  gem 'guard-rspec'
  # gem 'growl'             if RUBY_PLATFORM =~ /darwin/i
end

group :test do
  gem 'rspec',            '~> 2.9.0'
  gem 'rspec-rails',      '~> 2.9.0'
  gem 'mongoid-rspec',    '~> 1.4.4'
  gem 'spork',            '~> 1.0.0rc2'
  gem 'cucumber-rails',   '~> 1.3.0'
  gem 'capybara',         '~> 1.1.2'
  gem 'email_spec'
  gem 'simplecov'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
