lock "~> 3.19.1"

server '188.225.37.93', port: 22, roles: [:web, :app, :db], primary: true
set :user, 'deploy'
set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }


set :repo_url,        'git@github.com:stap780/marcel.git'
set :application,     'marcel'
set :branch,          'main'

set :pty,             true
# set :use_sudo,        true
# set :sudo, "sudo -u deploy -i"
set :stage,           :production
# set :deploy_via,      :remote_cache
set :deploy_to,       "/var/www/#{fetch(:application)}"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle','public', 'storage', 'lib')
set :linked_files, %w{config/database.yml config/master.key public/robots.txt public/favicon.ico public/404.html public/422.html public/500.html config/storage.yml }


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
