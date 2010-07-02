module Vidibus
  module Uuid
    module Mongoid
      extend ActiveSupport::Concern
      included do
        field :uuid
        before_validation :generate_uuid
        validates :uuid, :uniqueness => true, :uuid => true
      end
      
      private
      
      def generate_uuid
        return unless new_record?
        self.uuid ||= Vidibus::Uuid.generate
      end
    end
  end
end