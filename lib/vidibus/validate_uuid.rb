module Vidibus
  module ValidateUuid
    class UuidValidator < ActiveModel::EachValidator
      
      # Ensures that every value is of a valid compact UUID format
      def validate_each(record, attribute, value)
        unless value.to_s.match(/^[a-z0-9]{32}$/)
          record.errors[attribute] << "is not a valid UUID"
        end
      end
    end
  end
end