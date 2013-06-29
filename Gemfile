source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'pg', '~> 0.14.1'

gem 'activeadmin', '~> 0.5.1'
gem 'formtastic', '~> 2.1.1' # pin to work with activeadmin

gem 'less-rails', '~> 2.3.2'
gem 'twitter-bootstrap-rails', '~> 2.2.6'

gem 'carrierwave', '~> 0.8.0'
gem 'fog', '~> 1.10.0'

gem 'sidekiq', '~> 2.11.1'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', '~> 0.11.2', :platforms => :ruby
  gem 'libv8', '~> 3.11.8'
  
  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails', '~> 2.2.1'

gem 'rack-google-analytics', '~> 0.11.0', :require => 'rack/google-analytics'

group :production do
  gem 'thin'
  gem 'redis-rails', '~> 3.2.3'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.13.0'
  gem 'shoulda-matchers', '~> 1.5.1'
  gem 'factory_girl_rails', '~> 4.2.1'
  
  gem 'foreman'
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
