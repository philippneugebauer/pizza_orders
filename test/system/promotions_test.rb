require "application_system_test_case"

class PromotionsTest < ApplicationSystemTestCase
  setup do
    @promotion = promotions(:two)
  end

  test "visiting the index" do
    visit promotions_url
    assert_selector "h1", text: "Promotions"
  end

  test "should create promotion" do
    visit promotions_url
    click_on "New promotion"

    fill_in "Code", with: "#{@promotion.code}1"
    fill_in "From", with: @promotion.from
    select "Margherita", from: "Pizza"
    select "Small", from: "Pizza size"
    fill_in "To", with: @promotion.to
    click_on "Save"

    assert_text "Promotion was successfully created"
  end

  test "should update Promotion" do
    visit promotions_url
    click_on "Edit", match: :first

    fill_in "Code", with: "#{@promotion.code}2"
    fill_in "From", with: @promotion.from
    select "Margherita", from: "Pizza"
    select "Small", from: "Pizza size"
    fill_in "To", with: @promotion.to
    click_on "Save"

    assert_text "Promotion was successfully updated"
  end

  test "should destroy Promotion" do
    visit promotions_url
    find(:xpath, "(//button[text()='Delete'])[2]").click

    assert_text "Promotion was successfully destroyed"
  end
end
