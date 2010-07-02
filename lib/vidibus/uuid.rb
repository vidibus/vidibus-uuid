module Vidibus
  module Uuid
    def self.generate
      UUID.new.generate(:compact)
    end
  end
end