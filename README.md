# NLP Pure

[![Code Climate](https://codeclimate.com/github/parhamr/nlp-pure.png)](https://codeclimate.com/github/parhamr/nlp-pure) 
[![Build Status](https://travis-ci.org/parhamr/nlp-pure.svg?branch=master)](https://travis-ci.org/parhamr/nlp-pure) 
[![Coverage Status](https://coveralls.io/repos/parhamr/nlp-pure/badge.png?branch=master)](https://coveralls.io/r/parhamr/nlp-pure) 

Natural language processing algorithms implemented in pure Ruby with minimal dependencies.

NOTE: this is not affiliated with, endorsed by, or in any way connected with [Pure NLP](http://purenlp.com/), a trademark of John La Valle.

This project aims to provide functionality similar to [Treat](https://github.com/louismullie/treat), [open-nlp](https://github.com/louismullie/open-nlp), and [stanford-core-nlp](https://rubygems.org/gems/stanford-core-nlp) but with fewer dependencies. The code is tested against English language but the algorithm implementations aim to be flexible for other languages.

## Requirements

TODO

## Installation

TODO: `gem install 'nlp-pure'`

## Supported Ruby Versions

This library aims to support and is [tested against](https://travis-ci.org/parhamr/nlp-pure) the following Ruby
implementations:

* Ruby 2.0
* Ruby 2.1
* Ruby 2.2
* [JRuby](http://www.jruby.org/)
* [Rubinius](http://rubini.us/)

If something doesn't work on one of these interpreters, it's a bug.

This library may inadvertently work (or seem to work) on other Ruby
implementations, however support will only be provided for the versions listed
above.


## Versioning

This library aims to adhere to [Semantic Versioning 2.0.0](http://semver.org/). Violations
of this scheme should be reported as bugs. Specifically, if a minor or patch
version is released that breaks backward compatibility, that version should be
immediately yanked and/or a new version should be immediately released that
restores compatibility. Breaking changes to the public API will only be
introduced with new major versions. As a result of this policy, you can (and
should) specify a dependency on this gem using the [Pessimistic Version
Constraint](http://docs.rubygems.org/read/chapter/16#page74) with two digits of precision. For example:

```ruby
spec.add_dependency 'nlp-pure', '~> 0.1'
```
