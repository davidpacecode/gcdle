# frozen_string_literal: true

class CellComponent < ViewComponent::Base
  attr_reader :letter, :state

  # state can be :correct, :present, :absent, or :empty
  def initialize(letter: nil, state: :empty)
    @letter = letter
    @state = state
  end

  def cell_class
    base_classes = "flex items-center justify-center w-14 h-14 border-2 text-2xl font-bold rounded"

    case @state
    when :correct
      "#{base_classes} bg-green-500 text-white border-green-600"
    when :present
      "#{base_classes} bg-yellow-500 text-white border-yellow-600"
    when :absent
      "#{base_classes} bg-gray-500 text-white border-gray-600"
    else
      "#{base_classes} bg-white text-black border-gray-300"
    end
  end
end
