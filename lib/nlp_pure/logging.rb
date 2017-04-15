# encoding: utf-8

require 'time'
require 'logger'

#
module NlpPure
  #
  module Logging
    #
    class Pretty < Logger::Formatter
      def call(severity, time, _program_name, message)
        "#{time.utc.iso8601(2)} #{::Process.pid} #{severity}: #{message}\n"
      end
    end

    def self.initialize_logger(log_target = STDOUT)
      oldlogger = defined?(@logger) ? @logger : nil
      @logger = Logger.new(log_target)
      @logger.level = Logger::INFO
      @logger.formatter = Pretty.new
      oldlogger.close if oldlogger
      @logger
    end

    def self.logger
      defined?(@logger) ? @logger : initialize_logger
    end

    def self.logger=(log)
      @logger = (log ? log : Logger.new('/dev/null'))
    end

    def logger
      NlpPure::Logging.logger
    end
  end
end
