require 'travis/feierabend/deprecations'
require 'travis/feierabend/memory_storage'
require 'travis/feierabend/redis_storage'

require 'json'

module Travis
  module Feierabend
    attr_reader :storage

    def initialize(storage)
      @storage = storage
    end

    def deprecated(label, meta={})
      data = {
        trace: Kernel.caller_locations.join("\n"),
        meta: meta,
      }
      @storage.store(label, JSON.dump(data))
    end

    def list_in_use(label)
      @storage.list_in_use(label).map { |r| JSON.parse(r) }
    end

    class << self
      def configure(&block)
        @storage_factory = block
        @storage = nil
        @instance = nil
      end

      def storage
        if @storage_factory.nil?
          raise RuntimeError.new('tried to access global Travis::Feierabend without configuring it')
        end
        @storage ||= @storage_factory.call
      end

      def instance
        @instance ||= Feierabend.new(storage)
      end

      def deprecated(label, meta={})
        instance.deprecated(label, meta)
      end

      def list_in_use(label)
        instance.list_in_use(label)
      end
    end
  end
end
