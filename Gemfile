source 'https://rubygems.org'

gem 'rails', '3.2.17'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


gem 'pg'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "capistrano", '~>2.15.0', :require => nil
  gem "capistrano-ext", :require => nil
end

gem 'jquery-rails'

# Versioning for API
gem 'versionist'
gem 'active_model_serializers'

# Refinery CMS
gem 'refinerycms', '~> 2.1.0'

# Optionally, specify additional Refinery CMS Extensions here:
gem 'refinerycms-acts-as-indexed', '~> 1.0.0'
#  gem 'refinerycms-blog', '~> 2.1.0'
#  gem 'refinerycms-inquiries', '~> 2.1.0'
#  gem 'refinerycms-search', '~> 2.1.0'
#  gem 'refinerycms-page-images', '~> 2.1.0'

gem 'refinerycms-projects', :path => 'vendor/extensions'
gem 'refinerycms-tiers', :path => 'vendor/extensions'
gem 'refinerycms-orders', :path => 'vendor/extensions'
gem 'refinerycms-user_histories', :path => 'vendor/extensions'