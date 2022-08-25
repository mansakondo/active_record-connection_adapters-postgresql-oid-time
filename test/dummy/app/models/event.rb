class Event < ApplicationRecord
  attribute :start, :pg_time
  attribute :end, :pg_time
  attribute :times, :pg_time, array: true
end
