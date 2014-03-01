set :stage, :staging



set :user, "web"
set :domain, "crawdio.cz"
set :is_root_domain, false
set :root_domain, ""

set :deploy_to, "/home/#{user}/ruby/#{application}/staging.#{domain}"
set :rails_env, "staging"


set :bundle_flags, "--deployment --binstubs" # --quiet

# Roles
role :app, "#{machine}"
role :web, "#{machine}"
role :db, "#{machine}", :primary => true