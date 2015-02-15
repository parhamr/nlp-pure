# encoding: utf-8
require 'spec_helper'
require 'nlp_pure/segmenting/default_word'

describe NlpPure::Segmenting::DefaultWord do
  describe '[module]' do
    it 'is defined' do
      expect(defined?(NlpPure::Segmenting::DefaultWord)).to be_truthy
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
      let(:english_period_ellipses_sentence) { 'The quick brown fox...jumps over the lazy dog.' }
      let(:english_trailing_ellipses_sentence) { 'The quick brown fox jumps over the lazy dog …' }
      let(:english_spaced_period_ellipses_sentence) { 'The quick brown fox ... jumps over the lazy dog.' }
      let(:english_abbreviation_sentence) { 'The U.S.A. is a member of NATO.' }
      let(:english_simple_paragraph) { 'Mary had a little lamb. The lamb’s fleece was white as snow. Everywhere that Mary went, the lamb was sure to go.' }
      let(:english_simple_line_breaks) { "Mary had a little lamb,\nHis fleece was white as snow,\nAnd everywhere that Mary went,\nThe lamb was sure to go." }

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
          expect(NlpPure::Segmenting::DefaultWord.parse(english_period_ellipses_sentence).length).to eq(9)
        end

        it 'correctly segments spaced period-ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_spaced_period_ellipses_sentence).length).to eq(9)
        end

        it 'correctly segments with trailing, spaced ellipses' do
          expect(NlpPure::Segmenting::DefaultWord.parse(english_trailing_ellipses_sentence).length).to eq(9)
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
      end
    end
  end
end
