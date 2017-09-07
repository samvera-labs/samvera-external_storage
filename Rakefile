
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'bundler/gem_tasks'
require 'engine_cart/rake_task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

Dir.glob('tasks/*.rake').each { |r| import r }

RSpec::Core::RakeTask.new(:spec)

task :ci => ['engine_cart:generate'] do
  Rake::Task[:spec].invoke
end

task default: :ci
