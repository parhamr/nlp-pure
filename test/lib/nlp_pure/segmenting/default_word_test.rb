# encoding: utf-8

require 'minitest/autorun'
require 'nlp_pure/segmenting/default_word'

#
class TestNlpPureSegmentingDefaultWord < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Segmenting::DefaultWord), 'constant'
    end
  end

  describe '(English language)' do
    def english_simple_sentence
      'The quick brown fox jumps over the lazy dog.'
    end

    def english_hyphen_sentence
      'The New York-based company hired new staff.'
    end

    def english_dash_sentence
      'The quick brown fox—full of energy—jumps over the lazy dog.'
    end

    def english_spaced_dash_sentence
      'The quick brown fox — full of energy — jumps over the lazy dog.'
    end

    def english_twohyphen_sentence
      'The quick brown fox--full of energy--jumps over the lazy dog.'
    end

    def english_ellipsis_sentence
      'The quick brown fox…jumps over the lazy dog.'
    end

    def english_spaced_ellipsis_sentence
      'The quick brown fox … jumps over the lazy dog.'
    end

    def english_period_ellipsis_sentence
      'The quick brown fox...jumps over the lazy dog.'
    end

    def english_leading_ellipsis_sentence
      ' … the quick brown fox jumps over the lazy dog.'
    end

    def english_leading_period_ellipsis_sentence
      ' ... the quick brown fox jumps over the lazy dog.'
    end

    def english_trailing_ellipsis_sentence
      'The quick brown fox jumps over the lazy dog … '
    end

    def english_spaced_period_ellipsis_sentence
      'The quick brown fox ... jumps over the lazy dog.'
    end

    def english_abbreviation_sentence
      'The U.S.A. is a member of NATO.'
    end

    def english_simple_paragraph
      'Mary had a little lamb. The lamb’s fleece was white as snow. Everywhere that Mary went, the lamb was sure to go.'
    end

    def english_simple_line_breaks
      "Mary had a little lamb,\nHis fleece was white as snow,\nAnd everywhere that Mary went,\nThe lamb was sure to go."
    end

    describe '.parse' do
      describe 'with `nil` argument' do
        def test_parse_returns_array
          assert_equal [], NlpPure::Segmenting::DefaultWord.parse(nil)
        end
      end

      describe 'without arguments' do
        def test_parse_returns_nil
          assert_nil NlpPure::Segmenting::DefaultWord.parse
        end
      end

      def test_parse_returns_array
        assert_instance_of Array, NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence)
      end

      def test_parse_correctly_counts_words
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence).length
      end

      def test_parse_correctly_segments_hyphens
        assert_equal 8, NlpPure::Segmenting::DefaultWord.parse(english_hyphen_sentence).length
      end

      def test_parse_correctly_segments_doublehyphen_dashes
        assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_twohyphen_sentence).length
      end

      def test_parse_correctly_segments_dashes
        assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_dash_sentence).length
      end

      def test_parse_correctly_segments_spaced_dashes
        assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_spaced_dash_sentence).length
      end

      def test_parse_correctly_segments_ellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_ellipsis_sentence).length
      end

      def test_parse_correctly_segments_spaced_ellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_spaced_ellipsis_sentence).length
      end

      def test_parse_correctly_segments_periodellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_period_ellipsis_sentence).length
      end

      def test_parse_correctly_segments_spaced_periodellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_spaced_period_ellipsis_sentence).length
      end

      def test_parse_correctly_segments_leading_spaced_periodellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_leading_ellipsis_sentence).length
      end

      def test_parse_correctly_segments_trailing_spaced_periodellipses
        assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_trailing_ellipsis_sentence).length
      end

      def test_parse_does_not_segment_abbreviations
        assert_equal 7, NlpPure::Segmenting::DefaultWord.parse(english_abbreviation_sentence).length
      end

      def test_parse_correctly_segments_longer_texts
        assert_equal 22, NlpPure::Segmenting::DefaultWord.parse(english_simple_paragraph).length
      end

      def test_parse_correctly_segments_line_breaks
        assert_equal 22, NlpPure::Segmenting::DefaultWord.parse(english_simple_line_breaks).length
      end
    end
  end
end
