# frozen_string_literal: true

class RowComponent < ViewComponent::Base
  attr_reader :guess, :target_word

  def initialize(guess: "", target_word: "", current: false)
    @guess = guess
    @target_word = target_word
  end
end
