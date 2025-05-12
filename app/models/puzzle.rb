class Puzzle < ApplicationRecord
  belongs_to :word

  validates :puzzle_date, presence: true, uniqueness: true
  validates :puzzle_number, presence: true, uniqueness: true
end
