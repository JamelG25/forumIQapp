require 'test_helper'

class ForumThreadsControllerTest < ActionController::TestCase
  test "should get forum" do
    get :forum
    assert_response :success
  end

end
