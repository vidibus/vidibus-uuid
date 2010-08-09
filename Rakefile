require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "vidibus-uuid"
    gem.summary = %Q{Provides UUID generation through UUID gem.}
    gem.description = %Q{Provides UUID generation for Mongoid models. It includes a validator for UUIDs.}
    gem.email = "andre@vidibus.com"
    gem.homepage = "http://github.com/vidibus/vidibus-uuid"
    gem.authors = ["Andre Pankratz"]
    gem.add_development_dependency "rspec"
    gem.add_development_dependency "mongoid", "= 2.0.0.beta.15"
    gem.add_dependency "uuid"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies
task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "vidibus-uuid #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
