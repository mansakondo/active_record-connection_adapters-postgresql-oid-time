module ActiveRecord
  module ConnectionAdapters
    class PostgreSQLAdapter < AbstractAdapter
      module RegisterTimeType
        extend ActiveSupport::Concern

        prepended do
          ActiveRecord::Type.register(:pg_time, OID::Time, adapter: :postgresql)
          ActiveModel::Type.register(:pg_time, OID::Time)
        end

        class_methods do
          def initialize_type_map(m)
            super
            register_class_with_precision m, "pg_time", OID::Time
          end
        end
      end

      prepend RegisterTimeType
    end
  end
end
