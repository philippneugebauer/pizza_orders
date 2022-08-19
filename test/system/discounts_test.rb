require "application_system_test_case"

class DiscountsTest < ApplicationSystemTestCase
  setup do
    @discount = discounts(:two)
  end

  test "visiting the index" do
    visit discounts_url
    assert_selector "h1", text: "Discounts"
  end

  test "should create discount" do
    visit discounts_url
    click_on "New discount"

    fill_in "Code", with: "#{@discount.code}1"
    fill_in "Percentage", with: @discount.percentage
    click_on "Save"

    assert_text "Discount was successfully created"
  end

  test "should update Discount" do
    visit discounts_url
    click_on "Edit", match: :first

    fill_in "Code", with: "#{@discount.code}2"
    fill_in "Percentage", with: @discount.percentage
    click_on "Save"

    assert_text "Discount was successfully updated"
  end

  test "should destroy Discount" do
    visit discounts_url
    find(:xpath, "(//button[text()='Delete'])[2]").click

    assert_text "Discount was successfully destroyed"
  end
end
