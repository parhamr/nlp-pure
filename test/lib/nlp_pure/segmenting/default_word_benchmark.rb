# encoding: utf-8

require 'benchmark' if ENV["BENCH"]
require 'minitest/autorun'
require_relative '../../../../lib/nlp_pure/segmenting/default_sentence'
require_relative '../../../fixtures/corpus_english_default'

#
class BenchmarkNlpPureSegmentingDefaultWord < Minitest::Test
  if ENV["BENCH"]
    describe '[Benchmarking]' do

      include ::CorpusEnglishDefault

      def test_parse_average
        time = Benchmark.measure do
          10_000.times do
            NlpPure::Segmenting::DefaultWord.parse(english_abbreviation_sentence)
          end
        end
        assert_operator time.real, :<=, 0.4
      end
    end
  end
end
