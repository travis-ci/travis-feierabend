module Travis
  module Feierabend
    module Deprecations

      refine Module do

        def deprecate method_name, expiration_date: nil, new_method_name: nil
          method_name = method_name.intern
          alias_method :deprecated_method, method_name
          define_method method_name do |*args, &block|
            message = "[DEPRECATION] '#{method_name}' is deprecated."
            message << " Please use '#{new_method_name}' instead." if new_method_name
            message << " #{method_name} with no longer work after #{expiration_date}" if expiration_date
            warn message
            send :deprecated_method, *args, &block
          end
        end


          def replace_method method_name, replacement_method_name
            define_method method_name do |*args, &block|
              warn "[DEPRECATION] '#{method_name}' is no longer availible. Using '#{replacement_method_name}' instead."
              send replacement_method_name, *args, &block
            end
          end

      end
    end
  end
end
