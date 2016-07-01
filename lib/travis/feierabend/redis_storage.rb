require 'redis'

module Travis
  class Feierabend
    class RedisStorage
      attr_reader :redis

      def initialize(config={})
        @prefix = config[:prefix] || 'Feierabend:in_use:'
        @max_length = config[:max_length] || 500
        @redis = Redis.new(config[:redis] || {})
      end

      def store(label, trace)
        @redis.multi do
          @redis.rpush(@prefix+label, trace)
          @redis.ltrim(@prefix+label, 0, @max_length)
        end
      end

      def list_in_use(label)
        @redis.lrange(@prefix+label, 0, @max_length).reverse
      end
    end
  end
end
