set :deploy_env, 'production'
set :rails_env, 'production'

set :database_yml, "mongoid.yml"
set :current_rev, `git show --format='%H' -s`.chomp

servers = ["twkunion.com"]
set :servers, servers
role :db, :primary => true do servers end

after 'deploy:update', 'deploy:rvmrc_symlink'
# after 'deploy:update', 'deploy:precompile'
