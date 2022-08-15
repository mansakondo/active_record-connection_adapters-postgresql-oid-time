require "test_helper"

class ActiveRecord::ConnectionAdapters::Postgresql::Oid::TimeTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert ActiveRecord::ConnectionAdapters::Postgresql::Oid::Time::VERSION
  end
end
