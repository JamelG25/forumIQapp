require 'test_helper'

class ForumPostsControllerTest < ActionController::TestCase
  test "should get forum" do
    get :forum
    assert_response :success
  end

end
