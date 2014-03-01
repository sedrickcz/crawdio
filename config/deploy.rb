set :stages, %w(production staging)
set :default_stage, "staging"
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

set :application, "crawdio"

set :repository, "git@github.com:sedrickcz/#{application}.git"
set :ssh_options,   { :forward_agent => true }
set :machine,     "sedrick.cz"
