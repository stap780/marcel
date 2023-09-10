# config valid for current version and patch releases of Capistrano
lock "~> 3.17.3"

server '157.245.70.168', user: 'deploy', roles: %w{app db web}
set :unicorn_rack_env, -> { "production" }
set :branch, 'main'

set :application, 'marcel'
set :repo_url, 'git@github.com:stap780/marcel.git'
set :deploy_to, '/var/www/marcel'
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/sidekiq.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public', 'lib/tasks', 'lib/drop', 'storage')
set :format, :pretty
set :log_level, :info
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :sidekiq_default_hooks
# set :sidekiq_config, fetch(:sidekiq_config, []).push('config/sidekiq.yml') #not work right now
after 'deploy:publishing', 'unicorn:restart'

