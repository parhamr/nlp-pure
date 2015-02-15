# encoding: utf-8
module NlpPure
  # Namespace for NGram implementations
  module NGram
    module Word
      DEFAULT_OPTIONS = {}.freeze
      def parse(*args)
      end

      # NOTE: exposed as a method for easy mock/stub
      def options
        DEFAULT_OPTIONS
      end
    end
  end
end
