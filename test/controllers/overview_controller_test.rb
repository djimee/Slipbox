require 'test_helper'

class OverviewControllerTest < ActionDispatch::IntegrationTest
  test "should get myslipboxes" do
    get overview_myslipboxes_url
    assert_response :success
  end

end
