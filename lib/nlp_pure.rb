# encoding: utf-8

require 'nlp_pure/version'
raise "NLP Pure #{NlpPure::VERSION} does not support Ruby 1.9." if RUBY_PLATFORM != 'java' && RUBY_VERSION < '2.0.0'

#
module NlpPure
  NAME = 'NlpPure'.freeze
  LICENSE = 'See LICENSE for details.'.freeze

  DEFAULTS = {}.freeze

  def self.logger
    NlpPure::Logging.logger
  end

  def self.logger=(log)
    NlpPure::Logging.logger = log
  end
end
