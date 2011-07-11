require "mongoid"
require "uuid"

require "vidibus/uuid"
require "vidibus/uuid/validator"
require "vidibus/uuid/mongoid"

if defined?(Rails)
  module Vidibus::Uuid
    class Engine < ::Rails::Engine; end
  end
end

ActiveModel::Validations.send(:include, Vidibus::Uuid::Validator)
