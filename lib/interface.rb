# frozen_string_literal: true

require "tty-prompt"

class Interface
  def welcome_screen
    prompt.ok("Welcome")
  end

  private

  def prompt
    TTY::Prompt.new
  end

end
