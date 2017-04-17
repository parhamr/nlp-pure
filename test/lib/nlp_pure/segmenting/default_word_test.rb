# encoding: utf-8

require 'minitest/autorun'
require_relative '../../../../lib/nlp_pure/segmenting/default_word'
require_relative '../../../fixtures/corpus_english_default'

#
class TestNlpPureSegmentingDefaultWord < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Segmenting::DefaultWord), 'constant'
    end
  end

  describe '(English language)' do
    include ::CorpusEnglishDefault

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

      describe 'with strings' do

        def test_parse_returns_word_array
          assert_instance_of Array, NlpPure::Segmenting::DefaultWord.parse(english_default_sentence)
        end

        def test_parse_correctly_counts_words
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_default_sentence).length
        end

        def test_parse_does_not_mangle_english_default_sentence
          assert_equal english_default_sentence, NlpPure::Segmenting::DefaultWord.parse(english_default_sentence).join(NlpPure::Segmenting::DefaultWord.options[:segment_boundary])
        end

        def test_parse_correctly_word_segments_hyphens
          assert_equal 8, NlpPure::Segmenting::DefaultWord.parse(english_hyphen_sentence).length
        end

        def test_parse_does_not_mangle_english_hyphen_sentence
          assert_equal english_default_sentence, NlpPure::Segmenting::DefaultWord.parse(english_default_sentence).join(NlpPure::Segmenting::DefaultWord.options[:segment_boundary])
        end

        def test_parse_correctly_word_segments_doublehyphen_dashes
          assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_twohyphen_sentence).length
        end

        def test_parse_correctly_word_segments_dashes
          assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_dash_sentence).length
        end

        def test_parse_correctly_word_segments_spaced_dashes
          assert_equal 12, NlpPure::Segmenting::DefaultWord.parse(english_spaced_dash_sentence).length
        end

        def test_parse_correctly_word_segments_ellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_ellipsis_sentence).length
        end

        def test_parse_correctly_word_segments_spaced_ellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_spaced_ellipsis_sentence).length
        end

        def test_parse_correctly_word_segments_periodellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_period_ellipsis_sentence).length
        end

        def test_parse_correctly_word_segments_spaced_periodellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_spaced_period_ellipsis_sentence).length
        end

        def test_parse_correctly_word_segments_leading_spaced_periodellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_leading_ellipsis_sentence).length
        end

        def test_parse_correctly_word_segments_trailing_spaced_periodellipses
          assert_equal 9, NlpPure::Segmenting::DefaultWord.parse(english_trailing_ellipsis_sentence).length
        end

        def test_parse_does_not_word_segment_abbreviations
          assert_equal 7, NlpPure::Segmenting::DefaultWord.parse(english_abbreviation_sentence).length
        end

        def test_parse_correctly_word_segments_longer_texts
          assert_equal 22, NlpPure::Segmenting::DefaultWord.parse(english_default_paragraph).length
        end

        def test_parse_correctly_word_segments_line_breaks
          assert_equal 22, NlpPure::Segmenting::DefaultWord.parse(english_default_line_breaks).length
        end
      end
    end
  end
end
