# Core strategy
default_run_options[:pty] = true
default_run_options[:shell] = '/bin/bash --login'
set :use_sudo, false

# SCM
set :scm, :git
set :git_shallow_clone, 1
set :branch, "master"
set :deploy_via, :remote_cache
set :copy_exclude, %w(test .git doc)

# Symlinks
#set :normal_symlinks, ["db/production.sqlite3"]

set :directory_symlinks, {
    'assets' => 'public/assets'
}

# Miscs
set :keep_releases, 3
after "deploy:update", "deploy:cleanup"
