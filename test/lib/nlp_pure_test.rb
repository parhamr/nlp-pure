require 'minitest/autorun'
require 'nlp_pure'

class TestNlpPure < Minitest::Test
  def test_module_is_defined
    assert_equal defined?(NlpPure), "constant"
  end
end
