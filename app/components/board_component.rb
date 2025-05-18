# frozen_string_literal: true

class BoardComponent < ViewComponent::Base
  attr_reader :target_word, :guesses, :puzzle_id

  def initialize(target_word:, guesses: [], puzzle_id: nil)
    @target_word = target_word
    @guesses = guesses
    @puzzle_id = puzzle_id
  end

  def board_message
    "You can do it!"
  end

  def rows
    result = []

    5.times do |i|
      # Add rows for existing guesses
      result << render(RowComponent.new(
        target_word: target_word,
        guess: guesses[i],
      ))
    end

   result
  end

  def board_image
    "yes_sweet.gif"
  end

  def game_over?
    guesses.include?(target_word) || guesses.length >= 6
  end

  def won?
    guesses.include?(target_word)
  end
end
