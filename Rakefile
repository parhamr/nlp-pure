require 'bundler'
Bundler::GemHelper.install_tasks

begin
  task :coverage do
    require 'coveralls'
    Coveralls.wear_merged!
    require 'minitest'
  end

  require 'rake/testtask'
  Rake::TestTask.new(:test) do |t|
    t.verbose = true
    t.pattern = 'test/**/*_test.rb'
  end

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new(:rubocop) do |task|
    # don't abort rake on failure
    task.fail_on_error = false
  end

  task :default => [:coverage, :test, :rubocop]
rescue LoadError => e
  STDERR << "#{e.class}: #{e.message} (#{e.backtrace[0]})"
end
