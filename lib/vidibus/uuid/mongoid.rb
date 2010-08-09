module Vidibus
  module Uuid
    module Mongoid
      extend ActiveSupport::Concern
      included do
        field :uuid
        index :uuid, :unique => true
        before_validation :generate_uuid
        validates :uuid, :uniqueness => true, :uuid => true
      end
      
      # Returns UUID as param for urls.
      def to_param
        uuid
      end
      
      private
      
      # Sets unique UUID unless uuid is present.
      def generate_uuid
        self.uuid ||= Vidibus::Uuid.generate
      end
    end
  end
end