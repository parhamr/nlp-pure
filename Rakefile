require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'rake/testtask'
  Rake::TestTask.new(:test) do |t|
    if ENV['COVERAGE']
      require 'coveralls'
      Coveralls.wear_merged!
    end
    require 'minitest'
    require_relative 'test/test_helper'
    Dir.glob('./test/**/*_test.rb').each { |file| require file }
    t.verbose = true
    t.pattern = 'test/**/*_test.rb'
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # don't abort rake on failure
    task.fail_on_error = false
  end

  task default: [:test, :rubocop]
rescue LoadError => e
  STDERR << "#{e.class}: #{e.message} (#{e.backtrace[0]})"
end
