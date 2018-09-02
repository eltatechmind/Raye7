require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get places_new_url
    assert_response :success
  end

end
