require 'test_helper'

class ContactsControllerTest < ActionController::TestCase
  test "should get forum" do
    get :forum
    assert_response :success
  end

end
