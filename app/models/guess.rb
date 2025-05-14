class Guess < ApplicationRecord
  belongs_to :game
  validates :value, :guess_number, presence: true
end
