# frozen_string_literal: true

class BoardComponent < ViewComponent::Base
  attr_reader :target_word, :guesses, :game_id

  def initialize(target_word:, guesses: [], game_id: nil)
    @target_word = target_word
    @guesses = guesses
    @game_id = game_id
  end

  def rows
    result = []

    5.times do |i|
      # Add rows for existing guesses
      result << render(RowComponent.new(
        target_word: target_word,
        guess: guess,
        row_index: index
      ))
    end

    # Add empty rows up to 6 total
    #    remaining_rows = 6 - guesses.length
    #    remaining_rows.times.with_index do |_, i|
    #      active = i == 0 && guesses.length < 6 && guesses.last != target_word
    #      result << render(RowComponent.new(
    #        target_word: target_word,
    #        row_index: guesses.length + i,
    #        active: active
    #      ))
    #    end

    result
  end

  def game_over?
    guesses.include?(target_word) || guesses.length >= 6
  end

  def won?
    guesses.include?(target_word)
  end
end
