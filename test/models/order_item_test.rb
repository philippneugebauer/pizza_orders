require "test_helper"

class OrderItemTest < ActiveSupport::TestCase

  setup do
    @order_item = OrderItem.new pizza: pizzas(:one), pizza_size: pizza_sizes(:one)
    @order_item_with_extras = order_items(:one)
  end

  test "compute pizza price" do
    assert_equal 3.5, @order_item.compute_pizza_price()
  end

  test "compute price without having extras" do
    assert_equal @order_item.compute_pizza_price(), @order_item.compute_price()
  end

  test "compute extras price" do
    assert_equal 1.75, @order_item_with_extras.compute_extras_price()
  end

  test "compute price with extras" do
    assert_equal 5.25, @order_item_with_extras.compute_price()
  end

end
