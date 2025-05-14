class Game < ApplicationRecord
  belongs_to :puzzle
  has_many :guesses, dependent: :destroy

  validates :status, inclusion: { in: %w[active win loss abandoned] }
end
