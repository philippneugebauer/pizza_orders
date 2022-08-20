require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should complete order" do
    visit orders_url
    click_on "Complete", match: :first

    assert_text "Order completed."
  end
end
