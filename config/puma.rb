#https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server
#https://github.com/jollygoodcode/jollygoodcode.github.io/issues/12#issuecomment-165015203

workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['MAX_THREADS'] || 5)
threads threads_count, threads_count

preload_app!

rackup      DefaultRackup
port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'development'

if /true/i.match(ENV['DOCKER'])
  daemonize false
end

stdout_redirect './log/puma.stdout.log', './log/puma.stderr.log', true

pidfile './tmp/pids/puma.pid'
state_path './tmp/pids/puma.state'


on_worker_boot do
  # Worker specific setup for Rails 4.1+
  # See: https://devcenter.heroku.com/articles/deploying-rails-applications-with-the-puma-web-server#on-worker-boot
  ActiveRecord::Base.establish_connection
end

on_restart do
  Sidekiq.redis.shutdown { |conn| conn.close }
end
