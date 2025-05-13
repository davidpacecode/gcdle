class Puzzle < ApplicationRecord
  belongs_to :word

  validates :puzzle_date, presence: true, uniqueness: true
  validates :puzzle_number, presence: true, uniqueness: true

  before_validation :set_puzzle_number, on: :create

  def self.get_current_puzzle_date
    Puzzle.maximum(:puzzle_date)
  end

  def self.get_current_puzzle_number
    Puzzle.maximum(:puzzle_number)
  end

  private

  def set_puzzle_number
    return if puzzle_number.present?
    self.puzzle_number = Puzzle.maximum(:puzzle_number).to_i + 1
  end
end
