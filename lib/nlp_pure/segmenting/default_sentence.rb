# encoding: utf-8

module NlpPure
  module Segmenting
    # SEE ALSO: Unsupervised Multilingual Sentence Boundary Detection. Kiss, Strunk; 2006.
    # NOTE: this fails on some proper nouns with abbreviations (e.g. business names)
    #       and fails on single-linebreak headings
    module DefaultSentence
      DEFAULT_OPTIONS = {
        # punctuation or linebreaks
        split: /([.?!]|\n{2,}|\r\n)+/,
        # array of arrays; [0] should be regexp, [1] should be replacement
        # NOTE: minor performance risk in letting this array grow long
        gsub:  [
          # period ellipses need reconstruction
          [/\.{3,}/, '…']
        ],
        naive_sentence_word_count: 3,
        segment_boundary: '. '
      }.freeze

      module_function

      # NOTE: exposed as a method for easy mock/stub
      def options
        DEFAULT_OPTIONS
      end

      def parse(*args)
        return nil if args.nil? || args.empty?
        # naive split
        segments = clean_input(args[0]).split(options.fetch(:split, nil))
        # skip rejoin if one segment
        return segments if segments.length == 1
        parsed_segments = rejoin_segment_fragments(segments).compact
        NlpPure.logger.debug "#{parsed_segments.inspect}\n"
        parsed_segments
      end

      def clean_input(text = nil)
        input = text.to_s
        # perform replacements to work around the limitations of the splitting regexp
        options.fetch(:gsub, []).each do |gsub_pair|
          input.gsub!(gsub_pair[0], gsub_pair[1])
        end
        # NOTE: leading whitespace is problematic; ref #12
        input.strip
      end

      def rejoin_segment_fragments(segments)
        reassociated_segments = []
        # take all segments
        while (segment = segments.shift)
          NlpPure.logger.debug "#{segment.inspect}\n"
          # join segments if needed
          reassociated_segments << handle_special_fragments(segments, segment)
        end
        reassociated_segments
      end

      # rejoin leading punctuation, abbreviation, and numbers
      def handle_special_fragments(segments, segment)
        # NOTE: always index zero because we're shifting
        while next_segment_appears_included?(segments[0])
          NlpPure.logger.debug "\t\t<< #{segments[0].inspect}\n"
          segment = "#{segment}#{segments.shift}"
        end
        segment.strip
      end

      def next_segment_appears_included?(segment)
        return false unless segment
        # NOTE: the logic is expanded for logging reasons (despite style violation)
        if segment[0] =~ options.fetch(:split, nil)
          NlpPure.logger.debug "\t! leading punctuation detected\n"
        elsif segment[0] =~ /^\w/
          NlpPure.logger.debug "\t! assuming abbreviation\n"
        elsif segment =~ /^\s[a-z0-9]/
          NlpPure.logger.debug "\t! greedily continuing sentence\n"
        elsif segment =~ /^\d/
          NlpPure.logger.debug "\t! leading numeral detected\n"
        else
          NlpPure.logger.debug "\t\tx\n"
          return false
        end
        true
      end

    end
  end
end
