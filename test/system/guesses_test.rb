require "application_system_test_case"

class GuessesTest < ApplicationSystemTestCase
  setup do
    @guess = guesses(:one)
  end

  test "visiting the index" do
    visit guesses_url
    assert_selector "h1", text: "Guesses"
  end

  test "should create guess" do
    visit guesses_url
    click_on "New guess"

    fill_in "Game", with: @guess.game_id
    fill_in "Guess number", with: @guess.guess_number
    fill_in "Value", with: @guess.value
    click_on "Create Guess"

    assert_text "Guess was successfully created"
    click_on "Back"
  end

  test "should update Guess" do
    visit guess_url(@guess)
    click_on "Edit this guess", match: :first

    fill_in "Game", with: @guess.game_id
    fill_in "Guess number", with: @guess.guess_number
    fill_in "Value", with: @guess.value
    click_on "Update Guess"

    assert_text "Guess was successfully updated"
    click_on "Back"
  end

  test "should destroy Guess" do
    visit guess_url(@guess)
    accept_confirm { click_on "Destroy this guess", match: :first }

    assert_text "Guess was successfully destroyed"
  end
end
