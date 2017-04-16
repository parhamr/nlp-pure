# encoding: utf-8

require 'minitest/autorun'
require_relative '../../../../lib/nlp_pure/segmenting/default_sentence'
require_relative '../../../fixtures/corpus_english_simple'

#
class TestNlpPureSegmentingDefaultSentence < Minitest::Test
  describe '[module]' do
    def test_module_is_defined
      assert_equal defined?(NlpPure::Segmenting::DefaultSentence), 'constant'
    end
  end

  describe '(English language)' do
    include ::CorpusEnglishSimple

    describe '.parse' do
      describe 'with `nil` argument' do
        def test_parse_returns_array
          assert_equal [], NlpPure::Segmenting::DefaultSentence.parse(nil)
        end
      end

      describe 'without arguments' do
        def test_parse_returns_nil
          assert_nil NlpPure::Segmenting::DefaultSentence.parse
        end
      end

      describe 'with strings' do
        def test_parse_returns_sentence_array
          assert_instance_of Array, NlpPure::Segmenting::DefaultSentence.parse(english_simple_sentence)
        end

        def test_parse_correctly_counts_sentences
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_simple_sentence).length
        end

        def test_parse_correctly_sentence_segments_hyphens
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_hyphen_sentence).length
        end

        def test_parse_correctly_sentence_segments_doublehyphen_dashes
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_twohyphen_sentence).length
        end

        def test_parse_correctly_sentence_segments_dashes
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_dash_sentence).length
        end

        def test_parse_correctly_sentence_segments_spaced_dashes
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_spaced_dash_sentence).length
        end

        def test_parse_correctly_sentence_segments_ellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_ellipsis_sentence).length
        end

        def test_parse_correctly_sentence_segments_spaced_ellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_spaced_ellipsis_sentence).length
        end

        def test_parse_correctly_sentence_segments_periodellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_period_ellipsis_sentence).length
        end

        def test_parse_correctly_sentence_segments_spaced_periodellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_spaced_period_ellipsis_sentence).length
        end

        def test_parse_correctly_sentence_segments_leading_spaced_periodellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_leading_ellipsis_sentence).length
        end

        def test_parse_correctly_sentence_segments_trailing_spaced_periodellipses
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_trailing_ellipsis_sentence).length
        end

        def test_parse_does_not_sentence_segment_abbreviations
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_abbreviation_sentence),
            ["The U.S.A. is a member of NATO."]
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_abbreviation_sentence).length
        end

        def test_parse_does_not_sentence_segment_financial_jargon
          skip("FIXME: financial jargon is hard")
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_financial_sentence),
            [english_financial_sentence]
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_financial_sentence).length
        end

        def test_parse_correctly_sentence_segments_longer_texts
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_simple_paragraph),
            ["Mary had a little lamb.", "The lamb’s fleece was white as snow.", "Everywhere that Mary went, the lamb was sure to go."]
          assert_equal 3, NlpPure::Segmenting::DefaultSentence.parse(english_simple_paragraph).length
        end

        def test_parse_correctly_sentence_segments_line_breaks
          assert_equal 1, NlpPure::Segmenting::DefaultSentence.parse(english_simple_line_breaks).length
        end

        def test_parse_correctly_sentence_segments_exclamations
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_excalamations),
            ["I am excited!", "Today is Friday."]
          assert_equal 2, NlpPure::Segmenting::DefaultSentence.parse(english_excalamations).length
        end

        def test_parse_correctly_sentence_segments_questions
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_leading_question),
            ["On which side of the road do you drive?", "In North America we drive on the right side."]
          assert_equal 2, NlpPure::Segmenting::DefaultSentence.parse(english_leading_question).length
        end

        def test_parse_correctly_sentence_usa_constitution_preamble
          assert_equal NlpPure::Segmenting::DefaultSentence.parse(english_usa_constitution_preamble)[0],
            "United States of America 1789 (rev. 1992)"
          assert_equal 3, NlpPure::Segmenting::DefaultSentence.parse(english_usa_constitution_preamble).length
        end
      end
    end
  end
end
