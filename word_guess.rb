# Regular Expression Practice
class Screen

  def cls #clears the screen
    puts ("\n" * 25)
    puts "\a"
  end

  def pause
    gets
  end

end

class Game

  def display_greeting
    Console_Screen.cls
    print "\t\t\tWelcome to the Word Guessing Game!" + "\n\n\n\n\n\n\n\n\n\nPress Enter to " + "continue."
    Console_screen.pause
  end

end
