# frozen_string_literal: true


server '85.10.221.179', user: 'chatwoot_guy', port: 22, roles: [:web, :app, :db], primary: true

set :user,            'chatwoot_guy'
set :puma_threads,    [2, 4]
set :puma_workers,    0

# Don't change these unless you know what you're doing
set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
# set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/vint19_chatwoot_guy_rsa) }
# set :ssh_options,     { forward_agent: true, user: fetch(:user) }
# default_run_options[:pty] = true
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true  # Change to false when not using ActiveRecord

## Defaults:
# set :scm,           :git
# set :branch,        :main
set :branch,        :main19





# istatpbx_guy@78.46.105.22

# set :application, 'pbx.istat24.com'
set :rails_env, 'production'
set :stage, 'production'
# set :deploy_to, "~/projects/#{fetch(:application)}"
# set :branch, 'main19'
# set :linked_files, %w[config/secrets.yml .env]
set :linked_files, fetch(:linked_files, []).push('.env')
# set :linked_files, %w[config/application.yml]
# set :linked_dirs, %w[log tmp backup]
# set :passenger_restart_with_touch, true
# set :rvm_ruby_version, '2.7.4'
# set :ssh_options, keys: %w[certs/final.pem], auth_methods: ['publickey'], forward_agent: true, port: 22
# set :pty, false
# set :rvm1_map_bins, fetch(:rvm1_map_bins).to_a.concat(%w[sidekiq sidekiqctl])
# set :sidekiq_monit_use_sudo, true
# set :sidekiq_service_name, 'Istat24_pbx_sidekiq_production'
# set :sidekiq_role, :sidekiq
