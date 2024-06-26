# config valid for current version and patch releases of Capistrano
lock "~> 3.18.0"

set :repo_url,        'git@github.com:stap780/marcel.git'
set :application,     'marcel'
set :branch,          'main'
# If using Digital Ocean's Ruby on Rails Marketplace framework, your username is 'rails'
set :puma_threads,    [4, 16]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
# set :use_sudo,        false
set :use_sudo,        true
set :sudo, "sudo -u deploy -i"
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/#{fetch(:application)}"
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle','public', 'storage', 'lib')
set :linked_files, %w{config/database.yml config/master.key public/robots.txt public/favicon.ico public/404.html public/422.html public/500.html }
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord


namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before 'deploy:starting', 'puma:make_dirs'
end

namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      # Update this to your branch name: master, main, etc. Here it's main
      unless `git rev-parse HEAD` == `git rev-parse origin/main`
        puts "WARNING: HEAD is not the same as origin/main"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  # desc 'Restart application'
  #   task :restart do
  #     on roles(:app), in: :sequence, wait: 5 do
  #       invoke 'puma:restart'
  #     end
  # end

#   desc "Restart sidekiq"
#   task :restart_sidekiq do
#     on roles(:app), in: :sequence, wait: 5 do
#       execute :sudo, :systemctl, :restart, :sidekiq
#     end
#   end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
#   after  :finishing,    :restart_sidekiq
end
