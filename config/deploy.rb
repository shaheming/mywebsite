# config valid only for current version of Capistrano
lock "3.8.0"

set :application, "mywebsite"
set :repo_url, "git@github.com:shaheming/mywebsite.git"
set :branch, "master"
# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/apps/mywebsite'

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml','config/wechat.yml')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')
set :passenger_restart_with_touch, true

# Default value for keep_releases is 5
# set :keep_releases, 5