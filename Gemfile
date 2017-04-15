source 'https://rubygems.org'
gemspec

gem 'rubocop'

platforms :rbx do
  gem 'psych'                    # if using yaml
  gem 'rubinius-developer_tools' # if using any of coverage, debugger, profiler
  gem 'rubysl', '~> 2.0'         # if using anything in the ruby standard library
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem 'jruby-openssl'
end

group :test do
  gem 'coveralls', require: false
  gem 'rake'
end
