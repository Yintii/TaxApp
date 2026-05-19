require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get Home" do
    get static_pages_Home_url
    assert_response :success
  end

  test "should get About" do
    get static_pages_About_url
    assert_response :success
  end

  test "should get Terms" do
    get static_pages_Terms_url
    assert_response :success
  end

  test "should get PrivacyPolicy" do
    get static_pages_PrivacyPolicy_url
    assert_response :success
  end
end
