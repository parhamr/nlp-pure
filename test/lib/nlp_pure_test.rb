# encoding: utf-8

require 'minitest/autorun'
require_relative '../../lib/nlp_pure'

#
class TestNlpPure < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure), 'constant'
    end
  end
end
