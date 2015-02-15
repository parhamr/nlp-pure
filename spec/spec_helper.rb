# encoding: utf-8
require 'rspec'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
