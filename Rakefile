require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:base_spec) do |task|
  task.pattern = 'spec/nlp-pure_spec.rb'
end

task :spec => %w[base_spec]

task :default => :spec
task :test => :spec
