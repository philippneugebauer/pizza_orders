require "test_helper"

class DiscountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discount = discounts(:two)
  end

  test "should get index" do
    get discounts_url
    assert_response :success
  end

  test "should get new" do
    get new_discount_url
    assert_response :success
  end

  test "should create discount" do
    assert_difference("Discount.count") do
      post discounts_url, params: { discount: { code: "#{@discount.code}1", percentage: @discount.percentage } }
    end

    assert_redirected_to discounts_url
  end

  test "should get edit" do
    get edit_discount_url(@discount)
    assert_response :success
  end

  test "should update discount" do
    patch discount_url(@discount), params: { discount: { code: "#{@discount.code}1", percentage: @discount.percentage } }
    assert_redirected_to discounts_url
  end

  test "should destroy discount" do
    assert_difference("Discount.count", -1) do
      delete discount_url(@discount)
    end

    assert_redirected_to discounts_url
  end
end
