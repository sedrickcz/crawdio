set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "crawdio"

set :repository, "https://github.com/sedrickcz/crawdio.git"
# set :ssh_options,   { :forward_agent => true }
set :scm_passphrase, "simonka1989"
set :machine,     "sedrick.cz"
