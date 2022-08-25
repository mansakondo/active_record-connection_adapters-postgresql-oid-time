require "active_record/connection_adapters/postgresql/oid/time/version"
require "active_record/connection_adapters/postgresql/oid/time/railtie"

module ActiveRecord
  require "active_record/connection_adapters"

  module ConnectionAdapters
    module PostgreSQL
      module OID
        class Time < Type::Value
          class Value < Type::Time::Value
            def initialize(ruby_time, postgres_time)
              super(ruby_time)
              @postgres_time = postgres_time
            end

            def change(time:, **args)
              @postgres_time = time
              self.class.new(super(**args), time)
            end

            def in_time_zone
              self.class.new(super, @postgres_time)
            end

            def to_time
              self.class.new(super, @postgres_time)
            end

            def inspect
              to_s
            end

            def as_json
              to_s
            end

            def to_json
              as_json.to_json
            end

            def to_s
              @postgres_time
            end
          end

          def serialize(value)
            value.to_s
          end

          private
            def cast_value(value)
              case value
              when String
                Value.new(::Time.parse(value), value)
              when Value
                value
              else
                return
              end
            end
        end
      end
    end

    require "active_record/connection_adapters/postgresql_adapter"
    require "active_record/connection_adapters/postgresql/register_time_type"
  end
end
