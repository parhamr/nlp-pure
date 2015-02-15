source 'https://rubygems.org'
gemspec

platforms :rbx do
  gem 'rubysl', '~> 2.0'         # if using anything in the ruby standard library
  gem 'psych'                    # if using yaml
  gem 'rubinius-developer_tools' # if using any of coverage, debugger, profiler
end

platforms :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcsqlite3-adapter'
end

group :test do
  gem 'rake'
  gem 'guard-minitest'
  gem 'guard-rubocop'
  gem 'coveralls', require: false
end
