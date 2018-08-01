require 'test_helper'

class TopPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get top_pages_index_url
    assert_response :success
  end

  test "should get rules" do
    get top_pages_rules_url
    assert_response :success
  end

  test "should get privacy" do
    get top_pages_privacy_url
    assert_response :success
  end

  test "should get contact" do
    get top_pages_contact_url
    assert_response :success
  end

end
