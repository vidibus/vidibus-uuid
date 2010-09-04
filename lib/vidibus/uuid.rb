require "uuid"

module Vidibus
  module Uuid
    
    # Returns a new compact UUID.
    def self.generate
      UUID.new.generate(:compact)
    end
    
    # Returns true if given UUID is valid.
    def self.validate(uuid)
      uuid = uuid.to_s
      UUID.validate(uuid) && uuid.length == 32
    end
  end
end
