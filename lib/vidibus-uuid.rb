require "vidibus/uuid"
require "vidibus/validate_uuid"
require "vidibus/uuid/mongoid"

# Add UUID validator
ActiveModel::Validations.send(:include, Vidibus::ValidateUuid)