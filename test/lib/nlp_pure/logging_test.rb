# encoding: utf-8

require 'minitest/autorun'
require_relative '../../../lib/nlp_pure/logging'

#
class TestNlpPureLogging < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Logging), 'constant'
    end
  end

  describe '[class]' do
    def test_class_is_defined
      assert_equal defined?(NlpPure::Logging::Pretty), 'constant'
    end

    def test_class_successfully_initializes
      assert_instance_of NlpPure::Logging::Pretty, NlpPure::Logging::Pretty.new
    end

    def test_class_self_initializes
      assert_instance_of Logger, NlpPure::Logging.logger
    end
  end
end
