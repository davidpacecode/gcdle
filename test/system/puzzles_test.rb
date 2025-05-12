require "application_system_test_case"

class PuzzlesTest < ApplicationSystemTestCase
  setup do
    @puzzle = puzzles(:one)
  end

  test "visiting the index" do
    visit puzzles_url
    assert_selector "h1", text: "Puzzles"
  end

  test "should create puzzle" do
    visit puzzles_url
    click_on "New puzzle"

    fill_in "Puzzle date", with: @puzzle.puzzle_date
    fill_in "Puzzle number", with: @puzzle.puzzle_number
    fill_in "Word", with: @puzzle.word_id
    click_on "Create Puzzle"

    assert_text "Puzzle was successfully created"
    click_on "Back"
  end

  test "should update Puzzle" do
    visit puzzle_url(@puzzle)
    click_on "Edit this puzzle", match: :first

    fill_in "Puzzle date", with: @puzzle.puzzle_date
    fill_in "Puzzle number", with: @puzzle.puzzle_number
    fill_in "Word", with: @puzzle.word_id
    click_on "Update Puzzle"

    assert_text "Puzzle was successfully updated"
    click_on "Back"
  end

  test "should destroy Puzzle" do
    visit puzzle_url(@puzzle)
    accept_confirm { click_on "Destroy this puzzle", match: :first }

    assert_text "Puzzle was successfully destroyed"
  end
end
