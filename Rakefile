require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'coveralls/rake/task'
  require 'rake/testtask'
  Rake::TestTask.new do |t|
    require './test/test_helper'
    t.verbose = true
    t.pattern = 'test/**/*_test.rb'
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # don't abort rake on failure
    task.fail_on_error = false
  end

  task :default => [:test, :rubocop, 'coveralls:push']
rescue LoadError => e
  STDERR << "#{e.class}: #{e.message} (#{e.backtrace[0]})"
end
