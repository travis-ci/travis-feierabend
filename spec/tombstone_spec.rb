require 'travis/feierabend'
require 'travis/feierabend/memory_storage'
require 'travis/feierabend/redis_storage'

RSpec.describe Travis::Feierabend, "#deprecated" do
  context "memory storage" do
    before {
      Travis::Feierabend.configure { Travis::Feierabend::MemoryStorage.new }
    }

    it "stores a refutation" do
     Travis::Feierabend.deprecated('2016-07-01/test-case')
     expect(Travis::Feierabend.get_refutations('2016-07-01/test-case').count).to be(1)
   end
  end

  context "redis storage" do
    before {
      Travis::Feierabend.configure { Travis::Feierabend::RedisStorage.new }

      redis = Travis::Feierabend.storage.redis
      redis.keys('feierabend:in_use:*').each do |key|
        redis.del(key)
      end
    }

    it "stores a refutation" do
     Travis::Feierabend.deprecated('2016-07-01/test-case')
     expect(Travis::Feierabend.get_refutations('2016-07-01/test-case').count).to be(1)
   end
  end
end
