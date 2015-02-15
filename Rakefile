require 'bundler'
Bundler::GemHelper.install_tasks

begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  RSpec::Core::RakeTask.new(:spec)

  task :rubocop do
    require 'rubocop'
    cli = RuboCop::CLI.new
    cli.run
  end

  task :default => [:spec, :rubocop]
rescue LoadError => e
  STDERR << "#{e.class}: #{e.message} (#{e.backtrace[0]})"
end
