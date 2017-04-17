# encoding: utf-8

module NlpPure
  module Segmenting
    #
    module DefaultWord
      require_relative './default_utility'
      extend NlpPure::Segmenting::DefaultUtility

      DEFAULT_OPTIONS = {
        # 3+ periods as pseudo-ellipsis (with optional whitespace)
        # OR hyphen, en dash, em dash, and whitespace
        split: /\s?\.{3,}\s?|[\s\-–—…]+/,
        # array of arrays; [0] should be regexp, [1] should be replacement
        # NOTE: minor performance risk in letting this array grow long
        gsub:  [
          # ellipses at the start of a string are problematic; ref #12
          [/^\s?(…|\.{3,})/, ' ']
        ],
        segment_boundary: ' '
      }.freeze

      module_function

      def parse(*args)
        return nil if args.nil? || args.empty?
        clean_input_default(args[0]).split(options.fetch(:split, nil))
      end

      # NOTE: exposed as a method for easy mock/stub
      def options
        DEFAULT_OPTIONS
      end
    end
  end
end
