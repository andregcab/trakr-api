# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "trackr-api"
set :repo_url, "git@github.com:andregcab/trakr-api.git"
set ssh_options: {
  keys: %w(/home/user_name/.ssh/id_rsa),
  forward_agent: false,
  auth_methods: %w(publickey),
}

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, -> { "/home/#{fetch(:user)}/apps/#{fetch(:application)}" }

# pulling instead of cloning each time
set :deploy_via, :remote_cache
set :copy_exclude, ['.git']

set :linked_dirs, %w(log)
append :linked_files, "config/master.key"

# puma
set :puma_preload_app, true
set :puma_init_active_record, true

namespace :puma do
  desc "Create dirs for puma pids and socket"
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local git is in sync with remote"
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/master"
        exit
      end
    end
  end

  desc "Initial deploy"
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  after :finishing, :cleanup
end
