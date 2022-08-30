require "test_helper"

class ActiveRecord::ConnectionAdapters::Postgresql::Oid::TimeTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ActiveRecord::ConnectionAdapters::Postgresql::Oid::Time::VERSION
  end

  setup do
    @event = Event.create start: "22:00", end: "24:00", times: ["22:00", "24:00"]
  end

  test "should display the time like Postgres" do
    assert "22:00", @event.end.to_s
    assert "22:00", @event.end.inspect

    assert "24:00", @event.end.to_s
    assert "24:00", @event.end.inspect

    assert ["22:00", "24:00"], @event.times.to_s
    assert ["22:00", "24:00"], @event.times.inspect
  end

  test "should get the proper JSON output" do
    assert "\{\"start\":\"22:00\",\"end\":\"24:00:00\",\"times\":[\"22:00\",\"24:00\"]\}", @event.to_json
    assert "\{\"id\":#{@event.id.to_json},\"start\":\"22:00\",\"end\":\"24:00:00\",\"times\":[\"22:00\",\"24:00\"],\"created_at\":\"#{@event.created_at}\",\"updated_at\":\"#{@event.updated_at}\"\}", @event.to_json
  end
end
