$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "..", "lib"))

require "rubygems"
require "mongoid"
require "rspec"
require "vidibus-uuid"

Mongoid.configure do |config|
  name = "vidibus-uuid_test"
  config.connect_to(name)
end

RSpec.configure do |config|
  config.after :suite do
    Mongoid::Sessions.default.collections.select do |c|
      c.name !~ /system/
    end.each(&:drop)
  end
end

I18n.load_path += Dir[File.join('config', 'locales', '**', '*.{rb,yml}')]
