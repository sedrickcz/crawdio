set :stage, :production



set :user, "web"
set :domain, "crawdio.cz"
set :is_root_domain, true
set :root_domain, ""

set :deploy_to, "/home/#{user}/ruby/#{application}/#{domain}"
set :rails_env, "production"


set :bundle_flags, "--deployment --binstubs" # --quiet

# Roles
role :app, "#{machine}"
role :web, "#{machine}"
role :db, "#{machine}", :primary => true