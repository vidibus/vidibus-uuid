require "vidibus/uuid"
require "vidibus/validate_uuid"
require "vidibus/uuid/mongoid"

if defined?(Rails)
  module Vidibus::Uuid
    class Engine < ::Rails::Engine; end  
  end
end

ActiveModel::Validations.send(:include, Vidibus::ValidateUuid)