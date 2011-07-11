require "bundler"
require "rdoc/task"
require "rspec"
require "rspec/core/rake_task"

Bundler::GemHelper.install_tasks

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "vidibus/uuid/version"

RSpec::Core::RakeTask.new(:rcov) do |t|
  t.pattern = "spec/**/*_spec.rb"
  t.rcov = true
  t.rcov_opts = ["--exclude", "^spec,/gems/"]
end

Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title = "vidibus-sysinfo #{Vidibus::Uuid::VERSION}"
  rdoc.rdoc_files.include("README*")
  rdoc.rdoc_files.include("lib/**/*.rb")
  rdoc.options << "--charset=utf-8"
end

task :default => :rcov
