# encoding: utf-8

module NlpPure
  module Segmenting
    #
    module DefaultWord
      DEFAULT_OPTIONS = {
        # 3+ periods as pseudo-ellipsis (with optional whitespace)
        # OR hyphen, en dash, em dash, and whitespace
        split: /\s?\.{3,}\s?|[\s\-–—…]+/,
        # array of arrays; [0] should be regexp, [1] should be replacement
        # NOTE: minor performance risk in letting this array grow long
        gsub:  [
          # ellipses at the start of a string are problematic; ref #12
          [/^\s?(…|\.{3,})/, ' ']
        ]
      }.freeze

      module_function

      def parse(*args)
        return nil if args.nil? || args.empty?
        clean_input(args[0]).split(options.fetch(:split, nil))
      end

      def clean_input(text = nil)
        input = text.to_s
        # perform replacements to work around the limitations of the splitting regexp
        options.fetch(:gsub, []).each do |gsub_pair|
          input.gsub!(gsub_pair[0], gsub_pair[1])
        end
        # NOTE: leading whitespace is problematic; ref #12
        input.strip
      end

      # NOTE: exposed as a method for easy mock/stub
      def options
        DEFAULT_OPTIONS
      end
    end
  end
end
