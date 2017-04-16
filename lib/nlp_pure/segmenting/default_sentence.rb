# encoding: utf-8

module NlpPure
  module Segmenting
    # SEE ALSO: Unsupervised Multilingual Sentence Boundary Detection. Kiss, Strunk; 2006.
    module DefaultSentence
      DEFAULT_OPTIONS = {
        # punctuation with whitespace
        split: /([.?!])+/,
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
        # rejoin fragments:
        #     end of sentence abbreviation
        #     end of sentence ellipses
        #     initials
        #     ordinal numbers
        returning = rejoin_segment_fragments(segments).compact
        STDERR << "#{returning}\n" if ENV["DEBUG"]
        returning
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
        while segment = segments.shift
          STDERR << "#{segment.inspect}\n" if ENV["DEBUG"]
          next if segment.length == 1 && segment =~ options.fetch(:split, nil)
          # join segments if needed
          reassociated_segments << rejoin_fragments(segments, segment)
        end
        reassociated_segments
      end

      def rejoin_fragments(segments, segment)
        # rejoin leading punctuation, abbreviation, and numbers
        while next_segment_appears_included?(segments[0])
          STDERR << "\t<< #{segments[0].inspect}\n" if ENV["DEBUG"]
          segment = "#{segment}#{segments.shift}"
        end
        # rejoin ending abbreviations
        if !segments.empty? && NlpPure::Segmenting::DefaultWord.parse(segment).last.to_s.scan(options.fetch(:split, nil)).length > 1
          STDERR << "\t<< abbreviation: #{segment.inspect} with #{segments[0].inspect}\n" if ENV["DEBUG"]
          segment = "#{segment}#{segments.shift}"
        end
        # the final segment looks like orphaned punctuation
        if (segments.last =~ options.fetch(:split, nil)) == 0
          if segments.length <= 2
            STDERR << "\t<< trailing punctuation: #{segments.last}\n" if ENV["DEBUG"]
            segment = "#{segment}#{segments.join}"
          else
            STDERR << "\t<< other: #{segments.inspect}\n" if ENV["DEBUG"]
            punctuation = segments.pop
            segments << "#{segments.pop}#{punctuation}"
          end
        end
        segment.strip
      end

      def next_segment_appears_included?(segment)
        segment &&
          (
            # first character of next segment is punctuation
            segment[0].match(options.fetch(:split, nil)) ||
            # first character of next segment is likely abbreviation
            segment[0].match(/\w/) ||
            # greedily grab if followed by lowercase
            segment[0].match(/\s[a-z]/) ||
            # first character of next segment is numeric
            segment[0].match(/\d/) ||
            # last word of current segment is abbreviation
            NlpPure::Segmenting::DefaultWord.parse(segment).length == 1
          )
      end

      def cleanup_segmenting(segments)
        segments.compact
      end
    end
  end
end
