$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "mongoid"
require "rspec"
require "vidibus-uuid"

Mongoid.configure do |config|
  name = "vidibus-uuid_test"
  host = "localhost"
  config.master = Mongo::Connection.new.db(name)
end

RSpec.configure do |config|
  config.after :suite do
    Mongoid.master.collections.select {|c| c.name !~ /system/}.each(&:drop)
  end
end

I18n.load_path += Dir[File.join('config', 'locales', '**', '*.{rb,yml}')]
