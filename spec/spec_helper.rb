$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "active_support/core_ext"
require "spec"
require "mongoid"
require "uuid"
require "vidibus-uuid"

Mongoid.configure do |config|
  name = "vidibus-uuid_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

Spec::Runner.configure do |config|  
  config.mock_with :rspec
  config.before(:each) do  
    Mongoid.master.collections.select { |c| c.name != 'system.indexes' }.each(&:drop)  
  end
end

I18n.load_path += Dir[File.join('config', 'locale', '**', '*.{rb,yml}')]