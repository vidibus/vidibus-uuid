module Vidibus
  module ValidateUuid
    class UuidValidator < ActiveModel::EachValidator
      
      # Ensures that every value is of a valid compact UUID format.
      def validate_each(record, attribute, value)
        unless Vidibus::Uuid.validate(value)
          record.errors.add(attribute, :invalid_uuid)
        end
      end
    end
  end
end
