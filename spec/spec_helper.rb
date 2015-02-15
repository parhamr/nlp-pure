# encoding: utf-8
require 'rspec'
require 'coveralls'

Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

#  # find all of these paths
#  Dir[
#    # attempts cross platform support
#    File.join('.', 'lib', '**', '*.rb'),
#    File.join('.', 'spec', 'lib', '**', '*.rb'),
#    File.join('.', 'spec', 'support', '**', '*.rb')
#  ].sort.each do |file|
#    require File.join(File.dirname(file), File.basename(file, '.rb'))
#  end
end
