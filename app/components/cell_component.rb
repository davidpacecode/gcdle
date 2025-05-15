# frozen_string_literal: true

class CellComponent < ViewComponent::Base
  attr_reader :letter, :state

  def initialize(letter: nil, state: :empty)
    @letter = letter
    @state = state # :empty, :correct, :present, :absent
  end

  def state_classes
    case @state
    when :correct
      "border-green-500 bg-green-500 text-white"
    when :present
      "border-yellow-500 bg-yellow-500 text-white"
    when :absent
      "border-gray-500 bg-gray-500 text-white"
    else
      "border-gray-300"
    end
  end
end
