require "test_helper"

class PuzzlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @puzzle = puzzles(:one)
  end

  test "should get index" do
    get puzzles_url
    assert_response :success
  end

  test "should get new" do
    get new_puzzle_url
    assert_response :success
  end

  test "should create puzzle" do
    assert_difference("Puzzle.count") do
      post puzzles_url, params: { puzzle: { puzzle_date: @puzzle.puzzle_date, puzzle_number: @puzzle.puzzle_number, word_id: @puzzle.word_id } }
    end

    assert_redirected_to puzzle_url(Puzzle.last)
  end

  test "should show puzzle" do
    get puzzle_url(@puzzle)
    assert_response :success
  end

  test "should get edit" do
    get edit_puzzle_url(@puzzle)
    assert_response :success
  end

  test "should update puzzle" do
    patch puzzle_url(@puzzle), params: { puzzle: { puzzle_date: @puzzle.puzzle_date, puzzle_number: @puzzle.puzzle_number, word_id: @puzzle.word_id } }
    assert_redirected_to puzzle_url(@puzzle)
  end

  test "should destroy puzzle" do
    assert_difference("Puzzle.count", -1) do
      delete puzzle_url(@puzzle)
    end

    assert_redirected_to puzzles_url
  end
end
