require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      order_item_attributes = {
        id: nil,
        pizza_id: @order.order_items.first.pizza_id,
        pizza_size_id: @order.order_items.first.pizza_size_id,
        _destroy: 0,
        extras: [],
        omited: []
      }
      post orders_url, params: { order: {
        discount_id: @order.discount_id,
        price: @order.price,
        promotions: [""],
        order_items_attributes: { "0" => order_item_attributes }
      } }
    end

    assert_redirected_to orders_url
    assert_equal 3.50, Order.last.price
  end

  test "should update order" do
    assert_difference("Order.open.count", -1) do
      patch order_url(@order)
    end
    assert_redirected_to orders_url
  end
end
