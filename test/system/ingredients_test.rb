require "application_system_test_case"

class IngredientsTest < ApplicationSystemTestCase
  setup do
    @ingredient = ingredients(:two)
  end

  test "visiting the index" do
    visit ingredients_url
    assert_selector "h1", text: "Ingredients"
  end

  test "should create ingredient" do
    visit ingredients_url
    click_on "New ingredient"

    fill_in "Name", with: "#{@ingredient.name}1"
    fill_in "Price", with: @ingredient.price
    click_on "Save"

    assert_text "Ingredient was successfully created"
  end

  test "should update Ingredient" do
    visit ingredients_url
    click_on "Edit", match: :first

    fill_in "Name", with: "#{@ingredient.name}2"
    fill_in "Price", with: @ingredient.price
    click_on "Save"

    assert_text "Ingredient was successfully updated"
  end

  test "should destroy Ingredient" do
    visit ingredients_url
    find(:xpath, "(//button[text()='Delete'])[2]").click

    assert_text "Ingredient was successfully destroyed"
  end
end
