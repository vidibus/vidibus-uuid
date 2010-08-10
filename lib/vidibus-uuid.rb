require "vidibus/uuid"
require "vidibus/validate_uuid"
require "vidibus/uuid/mongoid"

module Vidibus::Uuid
  class Engine < ::Rails::Engine; end  
end

ActiveModel::Validations.send(:include, Vidibus::ValidateUuid)