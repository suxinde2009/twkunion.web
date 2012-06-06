source 'http://ruby.taobao.org'

gem 'rails', '3.2.5'

# mongo support
gem 'mongo',      '1.6.2'
gem 'mongoid',    '2.4.10'
gem 'bson_ext',   '1.6.2'

# Core functions
gem 'devise',               '~> 2.1.0'
gem 'simple_form',          '~> 2.0.2'
gem 'inherited_resources',  '~> 1.3.1'
gem 'kaminari',             '~> 0.13.0'
gem 'nested_form',          '~> 0.2.0'
gem 'symbolize',            '~> 4.2.0', require: 'symbolize/mongoid'

# gem 'carrierwave', '~> 0.6.0'
gem 'carrierwave-mongoid',  '~> 0.2.0', require: 'carrierwave/mongoid'
gem 'mini_magick'

# Full-text search support
gem 'sunspot_rails', '~> 1.3.1'
gem 'sunspot_solr'
gem 'sunspot_mongoid', github: 'TV4/sunspot_mongoid'

# SNS support
gem 'omniauth-weibo-oauth2',          '~> 0.2.0'
gem "omniauth-qq-connect",            '~> 0.1.0'
gem 'weibo2',                         git: 'git://github.com/fmmp3/weibo2.git'

# Exception notifier
gem 'exception_notification_rails3', '~> 1.2.0', require: 'exception_notifier'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.5'
  gem 'coffee-rails', '~> 3.2.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

# asset gems
gem 'haml',           '~> 3.1.4'
gem 'haml-rails',     '~> 0.3.4'
gem 'jquery-rails'    
gem 'bourbon'

group :development do
  # Deploy with Capistrano
  # gem 'rvm-capistrano'
  gem 'capistrano', '~> 2.11.2'
  gem 'capistrano_colors'

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
