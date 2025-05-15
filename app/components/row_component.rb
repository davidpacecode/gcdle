# frozen_string_literal: true

class RowComponent < ViewComponent::Base
  attr_reader :word, :states, :word_length

  def initialize(word: "", states: [], word_length: 5)
    @word = word.upcase
    @states = states
    @word_length = word_length
  end
end
