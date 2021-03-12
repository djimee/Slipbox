require 'test_helper'

class SigninControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get signin_signin_url
    assert_response :success
  end

end
