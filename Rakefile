require 'rake/testtask'
require 'bundler/gem_tasks'
require 'coveralls/rake/task'

task default: :spec

task :console do
  exec 'irb -r samba_api -I ./lib'
end

Rake::TestTask.new do |t|
  t.libs << 'test'
end

require 'coveralls/rake/task'
Coveralls::RakeTask.new
task :test_with_coveralls => [:spec, :features, 'coveralls:push']

desc 'Run tests'
task default: :test
