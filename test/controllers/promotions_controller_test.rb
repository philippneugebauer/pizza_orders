require "test_helper"

class PromotionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:two)
  end

  test "should get index" do
    get promotions_url
    assert_response :success
  end

  test "should get new" do
    get new_promotion_url
    assert_response :success
  end

  test "should create promotion" do
    assert_difference("Promotion.count") do
      post promotions_url, params: { promotion: { code: "#{@promotion.code}1", from: @promotion.from, pizza_id: @promotion.pizza_id, pizza_size_id: @promotion.pizza_size_id, to: @promotion.to } }
    end

    assert_redirected_to promotions_url
  end

  test "should get edit" do
    get edit_promotion_url(@promotion)
    assert_response :success
  end

  test "should update promotion" do
    patch promotion_url(@promotion), params: { promotion: { code: "#{@promotion.code}1", from: @promotion.from, pizza_id: @promotion.pizza_id, pizza_size_id: @promotion.pizza_size_id, to: @promotion.to } }
    assert_redirected_to promotions_url
  end

  test "should destroy promotion" do
    assert_difference("Promotion.count", -1) do
      delete promotion_url(@promotion)
    end

    assert_redirected_to promotions_url
  end
end
