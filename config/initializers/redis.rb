
redis_uri = URI.parse(ENV['REDIS_URL'])
$redis = Redis::Namespace.new(
    'chat',
    redis: Redis.new(
        host: redis_uri.host,
        port: redis_uri.port)
)
