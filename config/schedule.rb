# frozen_string_literal: true

# env :PATH, ENV['PATH']
# ENV.each { |k, v| env(k, v) }
# set :output, 'log/cron_log.log'

# every 10.minutes do
  # rake 'db:migrate'
# end

# every 2.hours do
# end

# every 15.hours do
  # runner 'SomeService.do_something' # runner NOT WORKING! Only rake tasks!
# end

# env :PATH, ENV['PATH']

# env(:SHELL, '/bin/bash')

set :output, "#{path}/log/cron.log"
set :env_path, '"$HOME/.rbenv/shims":"$HOME/.rbenv/bin"'

job_type :rake,  %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec rake :task --silent :output }
# job_type :rake,  %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec rails :task --silent :output }

# DO NOT USE runner!!!!!!!! Freezes can be!!!!

# every 1.minutes, roles: [:app] do
#   # ReregisterNoregPhonesJob.perform_now
#   rake 'crontab_planned:reregister_noreg_phones'
#   # rake 'sidekiq:check' # NOT USE Sidekiq! ActiveJobs only!
# end

# every 5.minutes, roles: [:app] do
#   # FillOperatorsRegTimeJob.perform_now
#   rake 'crontab_planned:fill_operators_reg_time'
# end

# every 3.minutes, roles: [:db] do
#   rake 'db:migrate:ramdb' # for server restart на всякий случай... Вдруг чтото пойдёт не так и рамдб будет обнулена.
# end

# every :sunday, at: '1am', roles: [:db] do
#   # rake 'backups:create'
#   rake 'backups:clean_old_records'
# end

# every 1.day, at: '2am' do
#   rake 'data_cleaning:clean_old_saved_events'
# end

# It is working. Use this form preffered.
# every(:day, at: ['04:20', '14:20']) do rake 'db:migrate:ramdb' end
