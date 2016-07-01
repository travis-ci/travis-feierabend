module Travis
  class Feierabend
    class MemoryStorage
      def initialize
        @in_use = {}
      end

      def store(label, data)
        @in_use[label] ||= []
        @in_use[label].push(data)
      end

      def list_in_use(label)
        @in_use[label] || []
      end
    end
  end
end
