#web: /bin/bash -l -c "bundle exec puma -C config/puma.rb"
web: /bin/bash -l -c "bundle exec unicorn -p 5000 -c ./config/unicorn.rb"
#web: /bin/bash -l -c "bundle exec rails s"
worker: /bin/bash -l -c "bundle exec sidekiq"
