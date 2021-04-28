require 'test_helper'

class AppControllerTest < ActionDispatch::IntegrationTest
  test "should get myslipboxes" do
    get app_myslipboxes_url
    assert_response :success
  end

end
