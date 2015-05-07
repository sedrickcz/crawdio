set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "crawdio"

set :repository, "https://github.com/sedrickcz/crawdio.git"
# set :ssh_options,   { :forward_agent => true }
set :machine,     "sedrick.cz"


require 'capistrano-db-tasks'


# if you want to remove the dump file after loading
set :db_local_clean, true

# If you want to import assets, you can change default asset dir (default = system)
# This directory must be in your shared directory on the server
set :assets_dir, %w(public/assets public/system)

# if you want to work on a specific local environment (default = ENV['RAILS_ENV'] || 'development')
# set :locals_rails_env, "production"
