require "test_helper"

class DiscountTest < ActiveSupport::TestCase

  setup do
    @discount = discounts(:one)
  end

  test "compute discount sum" do
    assert 1.5 == @discount.compute_discount_sum(15)
  end

  test "discount price" do
    assert 13.5 == @discount.discount_price(15)
  end

end
