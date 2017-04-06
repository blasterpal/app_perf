#https://github.com/jollygoodcode/jollygoodcode.github.io/issues/12#issuecomment-165015203


Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL']  }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL']  }
end


