# frozen_string_literal: true

class BoardComponent < ViewComponent::Base
  attr_reader :guesses, :states, :max_guesses, :word_length

  def initialize(guesses: [], states: [], max_guesses: 6, word_length: 5)
    @guesses = guesses
    @states = states
    @max_guesses = max_guesses
    @word_length = word_length
  end
end
