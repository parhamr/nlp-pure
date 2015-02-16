# encoding: utf-8
require 'spec_helper'
require 'nlp_pure/segmenting/default_word'

describe NlpPure::Segmenting::DefaultWord do
  describe '[module]' do
    it 'is defined' do
      expect(defined?(NlpPure::Segmenting::DefaultWord)).to be_truthy
    end

    describe '::DEFAULT_OPTIONS' do
      it 'is Hash' do
        expect(NlpPure::Segmenting::DefaultWord::DEFAULT_OPTIONS).to be_a Hash
      end
    end
  end

  describe '.parse' do
    context 'English' do
      let(:english_simple_sentence) { 'The quick brown fox jumps over the lazy dog.' }
      let(:english_hyphen_sentence) { 'The New York-based company hired new staff.' }
      let(:english_dash_sentence) { 'The quick brown fox—full of energy—jumps over the lazy dog.' }
      let(:english_spaced_dash_sentence) { 'The quick brown fox — full of energy — jumps over the lazy dog.' }
      let(:english_twohyphen_sentence) { 'The quick brown fox--full of energy--jumps over the lazy dog.' }
      let(:english_ellipsis_sentence) { 'The quick brown fox…jumps over the lazy dog.' }
      let(:english_spaced_ellipsis_sentence) { 'The quick brown fox … jumps over the lazy dog.' }
      let(:english_period_ellipsis_sentence) { 'The quick brown fox...jumps over the lazy dog.' }
      let(:english_leading_ellipsis_sentence) { ' … the quick brown fox jumps over the lazy dog.' }
      let(:english_leading_period_ellipsis_sentence) { ' ... the quick brown fox jumps over the lazy dog.' }
      let(:english_trailing_ellipsis_sentence) { 'The quick brown fox jumps over the lazy dog … ' }
      let(:english_spaced_period_ellipsis_sentence) { 'The quick brown fox ... jumps over the lazy dog.' }
      let(:english_abbreviation_sentence) { 'The U.S.A. is a member of NATO.' }
      let(:english_simple_paragraph) { 'Mary had a little lamb. The lamb’s fleece was white as snow. Everywhere that Mary went, the lamb was sure to go.' }
      let(:english_simple_line_breaks) { "Mary had a little lamb,\nHis fleece was white as snow,\nAnd everywhere that Mary went,\nThe lamb was sure to go." }

      context '(with nil options)' do
        before do
          expect(NlpPure::Segmenting::DefaultWord).to receive(:options).at_least(:once).and_return(nil)
        end

        it 'raises NoMethodError' do
          expect { NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence) }.to raise_error
        end
      end

      context '(with blank options)' do
        before do
          expect(NlpPure::Segmenting::DefaultWord).to receive(:options).at_least(:once).and_return({})
        end

        it 'returns Array' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence)).to be_an Array
        end
      end

      context '(with default options)' do
        context 'with `nil` argument' do
          it 'does not raise error' do
            expect { NlpPure::Segmenting::DefaultWord.parse(nil) }.to_not raise_error
          end

          it 'returns Array' do
            expect(NlpPure::Segmenting::DefaultWord.parse(nil)).to be_an Array
          end
        end

        context 'without arguments' do
          it 'does not raise error' do
            expect { NlpPure::Segmenting::DefaultWord.parse }.to_not raise_error
          end

          it 'returns nil' do
            expect(NlpPure::Segmenting::DefaultWord.parse).to eq nil
          end
        end

        it 'returns Array' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence)).to be_an Array
        end

        it 'correctly counts words' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_simple_sentence).length).to eq(9)
        end

        it 'correctly segments hyphens' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_hyphen_sentence).length).to eq(8)
        end

        it 'correctly segments double-hyphen dashes' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_twohyphen_sentence).length).to eq(12)
        end

        it 'correctly segments dashes' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_spaced_dash_sentence).length).to eq(12)
        end

        it 'correctly segments spaced dashes' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_dash_sentence).length).to eq(12)
        end

        it 'correctly segments ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_ellipsis_sentence).length).to eq(9)
        end

        it 'correctly segments spaced ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_spaced_ellipsis_sentence).length).to eq(9)
        end

        it 'correctly segments period-ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_period_ellipsis_sentence).length).to eq(9)
        end

        it 'correctly segments spaced period-ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_spaced_period_ellipsis_sentence).length).to eq(9)
        end

        it 'correctly segments with leading, spaced ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_leading_ellipsis_sentence).length).to eq(9)
        end

        it 'correctly segments with trailing, spaced ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_trailing_ellipsis_sentence).length).to eq(9)
        end

        it 'does not segment abbreviations' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_abbreviation_sentence).length).to eq(7)
        end

        it 'correctly counts with longer texts' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_simple_paragraph).length).to eq(22)
        end

        it 'correctly counts with line breaks' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_simple_line_breaks).length).to eq(22)
        end

        context 'benchmarking' do
          before do
            require 'benchmark'
          end

          it 'takes time', benchmarking: true do
            expect(
              Benchmark.realtime do
                1000.times do
                  NlpPure::Segmenting::DefaultWord.parse(english_simple_line_breaks)
                end
              end
            ).to be < 0.1
          end
        end
      end
    end
  end

  describe '.clean_input' do
    context 'English' do
      let(:english_leading_ellipsis_sentence) { ' … the quick brown fox jumps over the lazy dog.' }

      context '(with nil options)' do
        before do
          expect(NlpPure::Segmenting::DefaultWord).to receive(:options).at_least(:once).and_return(nil)
        end

        it 'raises NoMethodError' do
          expect { NlpPure::Segmenting::DefaultWord.clean_input(english_leading_ellipsis_sentence) }.to raise_error
        end
      end

      context '(with blank options)' do
        before do
          expect(NlpPure::Segmenting::DefaultWord).to receive(:options).at_least(:once).and_return({})
        end

        it 'only strips whitespace' do
          expect(NlpPure::Segmenting::DefaultWord.clean_input(english_leading_ellipsis_sentence)).to eq english_leading_ellipsis_sentence.strip
        end
      end

      context '(with default options)' do
        context 'with `nil` argument' do
          it 'does not raise error' do
            expect { NlpPure::Segmenting::DefaultWord.clean_input(nil) }.to_not raise_error
          end

          it 'returns empty String' do
            expect(NlpPure::Segmenting::DefaultWord.clean_input(nil)).to eq ''
          end
        end

        context 'without arguments' do
          it 'does not raise error' do
            expect { NlpPure::Segmenting::DefaultWord.clean_input }.to_not raise_error
          end

          it 'returns nil' do
            expect(NlpPure::Segmenting::DefaultWord.clean_input).to eq ''
          end
        end

        it 'modifies the input' do
          expect(NlpPure::Segmenting::DefaultWord.clean_input(english_leading_ellipsis_sentence)).to_not eq english_leading_ellipsis_sentence
        end
      end
    end
  end
end
