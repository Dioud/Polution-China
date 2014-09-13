require 'test_helper'

class InformationControllerTest < ActionController::TestCase
  test "should get city" do
    get :city
    assert_response :success
  end

end
