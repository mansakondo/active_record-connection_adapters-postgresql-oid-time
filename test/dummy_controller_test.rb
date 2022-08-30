require "test_helper"

class DummyControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = Event.create start: "22:00", end: "24:00", times: ["22:00", "24:00"]
  end

  test "should get the proper JSON response" do
    get event_url(@event), as: :json
    assert_response :success

    assert "\{\"id\":#{@event.id},\"start\":\"22:00\",\"end\":\"24:00:00\",\"times\":[\"22:00\",\"24:00\"],\"created_at\":\"#{@event.created_at}\",\"updated_at\":\"#{@event.updated_at}\"\}", body
  end
end
