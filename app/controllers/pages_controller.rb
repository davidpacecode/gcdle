class PagesController < ApplicationController
  def home
    @current_puzzle_date = Puzzle.get_current_puzzle_date
    @current_puzzle_number = Puzzle.get_current_puzzle_number
  end
end
