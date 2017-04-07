#https://github.com/jollygoodcode/jollygoodcode.github.io/issues/12#issuecomment-165015203

app_name_space = "sidekiq:app_perf_#{Rails.env}"

# TODO add namespace
Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: app_name_space }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], namespace: app_name_space }
end


