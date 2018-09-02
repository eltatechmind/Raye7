require 'test_helper'

class PickupsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pickups_new_url
    assert_response :success
  end

end
