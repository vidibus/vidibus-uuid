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

      # Returns UUID as param for URLs.
      # If the UUID has been changed to an invalid value,
      # the old uuid will be returned.
      def to_param
        if uuid_changed? and uuid_was and !Vidibus::Uuid.validate(uuid)
          uuid_was
        else
          uuid
        end
      end

      private

      # Sets unique UUID unless uuid is present.
      def generate_uuid
        if [nil, ""].include?(uuid)
          self.uuid = Vidibus::Uuid.generate
        end
      end
    end
  end
end
