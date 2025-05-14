class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ home ]
  def home
    @current_puzzle = Puzzle.order(created_at: :desc).first
    @current_puzzle_date = Puzzle.get_current_puzzle_date
    @current_puzzle_number = Puzzle.get_current_puzzle_number
  end
end
