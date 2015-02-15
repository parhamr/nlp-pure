require 'minitest/autorun'
require 'nlp_pure/segmenting/default_word'

class TestNlpPureSegmentingDefaultWord < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Segmenting::DefaultWord), "constant"
    end
  end
end
