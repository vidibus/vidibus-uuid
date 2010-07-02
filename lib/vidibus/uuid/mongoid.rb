module Vidibus
  module Uuid
    module Mongoid
      extend ActiveSupport::Concern
      included do
        field :uuid
        before_create :generate_uuid
      end
      
      private
      
      def generate_uuid
        self.uuid = Vidibus::Uuid.generate
      end
    end
  end
end