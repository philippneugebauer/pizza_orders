require "application_system_test_case"

class PizzaSizesTest < ApplicationSystemTestCase
  setup do
    @pizza_size = pizza_sizes(:two)
  end

  test "visiting the index" do
    visit pizza_sizes_url
    assert_selector "h1", text: "Pizza sizes"
  end

  test "should create pizza size" do
    visit pizza_sizes_url
    click_on "New pizza size"

    fill_in "Multiplier", with: @pizza_size.multiplier
    fill_in "Name", with: "#{@pizza_size.name}1"
    click_on "Save"

    assert_text "Pizza size was successfully created"
  end

  test "should update Pizza size" do
    visit pizza_sizes_url
    click_on "Edit", match: :first

    fill_in "Multiplier", with: @pizza_size.multiplier
    fill_in "Name", with: "#{@pizza_size.name}2"
    click_on "Save"

    assert_text "Pizza size was successfully updated"
  end

  test "should destroy Pizza size" do
    visit pizza_sizes_url
    find(:xpath, "(//button[text()='Delete'])[2]").click

    assert_text "Pizza size was successfully destroyed"
  end
end
