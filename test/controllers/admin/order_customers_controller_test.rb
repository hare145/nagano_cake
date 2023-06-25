require "test_helper"

class Admin::OrderCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_order_customers_show_url
    assert_response :success
  end
end
