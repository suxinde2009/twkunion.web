# -*- coding: utf-8 -*-
require 'capistrano_colors'
require 'capistrano/ext/multistage'
require 'bundler/capistrano'

# Load RVM's capistrano plugin.
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"

ssh_options[:paranoid] = false
ssh_options[:forward_agent] = true

set :stages, ["production"]
set :default_stage, "production"

# set :copy_exclude, ".git/*"

# set tag or branch or revision
set :branch do
  default_tag = current_rev

  tag = Capistrano::CLI.ui.ask "Tag to deploy : [#{default_tag}] "
  tag = default_tag if tag.empty?
  tag
end

# set servers
set(:servers)  { "#{servers}" }
role :app do servers end

# == rvm setting
set :rvm_ruby_string, 'ruby-1.9.3-p362@twkunion'
set :rvm_type, :system
# ==

# == bundler setting
# set :bundle_flags, "--quiet"
set :bundle_without, [:development, :test]
# ==

set :application, "twkunion"
set :deploy_to,   "/var/www/#{application}"
set :repository,  "git@github.com:jerryshen/twkunion.web.git"

set :scm, :git
set :user, "www-data"

set :use_sudo, false
set :deploy_via, :remote_cache
set :default_run_options, :pty => true

# == for Unicorn restart
namespace :deploy do
  task :start do ; end
  task :stop do ; end

  task :restart, :roles => :app, :except => { :no_release => true } do
    run "kill -USR2 `cat /tmp/unicorn_app.pid`"
  end

  task :reload, :roles => :app, :except => { :no_release => true } do
    run "kill -HUP `cat /tmp/unicorn_app.pid`"
  end
end
# ==


# == add symlink
desc "after finish deploy (synmbolic link...etc)"
after "deploy:create_symlink", :roles => :app do
  run "ln -s #{shared_path}/config/#{database_yml} #{current_path}/config/mongoid.yml"
  run "ln -s #{shared_path}/uploads #{current_path}/public/uploads"
end
# ==

after 'deploy:update', 'deploy:cleanup'

namespace :deploy do

  task :precompile do
    run "cd #{release_path}; RAILS_ENV=#{rails_env} bundle exec rake assets:precompile --trace"
  end

  task :rvmrc_symlink do
    run "ln -fs #{current_path}/.rvmrc.sample #{current_path}/.rvmrc"
  end

end