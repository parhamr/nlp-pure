require 'minitest/autorun'
require 'nlp_pure/segmenting'

#
class TestNlpPureSegmenting < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Segmenting), 'constant'
    end
  end
end
