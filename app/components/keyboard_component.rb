# frozen_string_literal: true

class KeyboardComponent < ViewComponent::Base
  attr_reader :key_states

  def initialize(key_states: {})
    @key_states = key_states # Hash mapping letters to states (:correct, :present, :absent)
  end

  def keyboard_rows
    [
      %w[Q W E R T Y U I O P],
      %w[A S D F G H J K L],
      %w[ENTER Z X C V B N M ⌫]
    ]
  end

  def key_class(key)
    base_class = "min-w-[40px]"

    if key == "ENTER"
      "#{base_class} px-2 bg-gray-300"
    elsif key == "⌫"
      "#{base_class} px-2 bg-gray-300"
    else
      state = key_states[key.to_s] || :unused
      case state
      when :correct
        "#{base_class} bg-green-500 text-white"
      when :present
        "#{base_class} bg-yellow-500 text-white"
      when :absent
        "#{base_class} bg-gray-500 text-white"
      else
        "#{base_class} bg-gray-200"
      end
    end
  end

  def submit_path(key)
    if key == "ENTER"
      "/games/submit"
    elsif key == "⌫"
      "/games/backspace"
    else
      "/games/key?key=#{key}"
    end
  end
end
