class Word < ApplicationRecord
  validates :value, presence: true, uniqueness: true, length: { is: 5 }
end
