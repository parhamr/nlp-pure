# encoding: utf-8
require 'rspec'
require 'coveralls'

Coveralls.wear! do
  add_filter '/vendor/'
  add_filter '/test/'
  add_filter '/tmp/'
  add_filter '/spec/'
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
