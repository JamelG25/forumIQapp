require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get forum" do
    get :forum
    assert_response :success
  end

end
