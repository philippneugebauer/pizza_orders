require "test_helper"

class OrderTest < ActiveSupport::TestCase

  test "order price without promotion and discount" do
    @order = orders(:one)
    assert_equal 5.25, @order.compute_price()
  end

  test "order price with promotion and without discount" do
    @order_with_promotion = orders(:two)
    assert_equal 3.50, @order_with_promotion.compute_price()
  end

  test "order price with promotion and extras and without discount" do
    @order_with_promotion = orders(:six)
    assert_equal 5.25, @order_with_promotion.compute_price()
  end

  test "order price with not enough items for promotion and without discount" do
    @order_with_promotion = orders(:five)
    assert_equal 3.50, @order_with_promotion.compute_price()
  end

  test "order price without promotion and with discount" do
    @order_with_discount = orders(:three)
    assert_equal 6.30,  @order_with_discount.compute_price()
  end

  test "order price with promotion and discount" do
    @order_with_discount_and_promotion = orders(:four)
    assert_equal 3.15, @order_with_discount_and_promotion.compute_price()
  end

end
