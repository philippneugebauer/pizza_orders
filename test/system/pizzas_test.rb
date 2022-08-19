require "application_system_test_case"

class PizzasTest < ApplicationSystemTestCase
  setup do
    @pizza = pizzas(:two)
  end

  test "visiting the index" do
    visit pizzas_url
    assert_selector "h1", text: "Pizzas"
  end

  test "should create pizza" do
    visit pizzas_url
    click_on "New pizza"

    fill_in "Name", with: "#{@pizza.name}1"
    fill_in "Price", with: @pizza.price
    click_on "Save"

    assert_text "Pizza was successfully created"
  end

  test "should update Pizza" do
    visit pizzas_url
    click_on "Edit", match: :first

    fill_in "Name", with: "#{@pizza.name}2"
    fill_in "Price", with: @pizza.price
    click_on "Save"

    assert_text "Pizza was successfully updated"
  end

  test "should destroy Pizza" do
    visit pizzas_url
    find(:xpath, "(//button[text()='Delete'])[2]").click

    assert_text "Pizza was successfully destroyed"
  end
end
