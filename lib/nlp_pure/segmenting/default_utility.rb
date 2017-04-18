# encoding: utf-8

#
module NlpPure
  # Namespace for segmenting implementations
  module Segmenting
    #
    module DefaultUtility
      module_function

      def clean_input_default(text = nil)
        input = text.to_s
        # perform replacements to work around the limitations of the splitting regexp
        options.fetch(:gsub, []).each do |gsub_pair|
          input.gsub!(gsub_pair[0], gsub_pair[1])
        end
        # NOTE: leading whitespace is problematic; ref #12
        input.strip
      end
    end
  end
end
