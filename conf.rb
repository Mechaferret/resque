rails_root = ENV['RAILS_ROOT'] || File.dirname(__FILE__) + '/.'
rails_env = ENV['RAILS_ENV'] || 'development'

REDIS_CONFIG = YAML.load_file(rails_root + '/redis.yml')[rails_env]
Resque.redis = REDIS_CONFIG["host"] + ':' + REDIS_CONFIG["port"].to_s

Resque::Server.redis = REDIS_CONFIG["host"] + ':' + REDIS_CONFIG["port"].to_s