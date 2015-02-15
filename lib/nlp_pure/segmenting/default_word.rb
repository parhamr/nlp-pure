# encoding: utf-8

module NlpPure
  module Segmenting
    #
    module DefaultWord
      DEFAULT_OPTIONS = {
        # 3+ periods as pseudo-ellipsis (with optional whitespace)
        # OR hyphen, en dash, em dash, and whitespace
        split: /\s?\.{3,}+\s?|[\s\-–—…]+/
      }.freeze
      def self.parse(*args)
        unless args.nil? || args.empty?
          input = args[0].to_s
          input.split(options[:split])
        end
      end

      # NOTE: exposed as a method for easy mock/stub
      def self.options
        DEFAULT_OPTIONS
      end
    end
  end
end
