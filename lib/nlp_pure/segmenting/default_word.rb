# encoding: utf-8

module NlpPure
  module Segmenting
    #
    module DefaultWord
      DEFAULT_OPTIONS = {
        # hyphen, en dash, em dash, and string
        split: /[\-–—\s]/
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

require_relative '../segmenting'
