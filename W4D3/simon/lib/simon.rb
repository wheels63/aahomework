class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      self.take_turn
    end
    
    if !game_over
      self.game_over_message
      self.reset_game
    end

  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
  end

  def require_sequence
    @seq.each do |color|
      puts color
      puts "your input but first letters only pls"
      input = gets.chomp
      @game_over = true if color[0].downcase != input
    end
# The specs should guide you as to what each method does. 
#One important thing to note is that it is generally 
#impractical to test console user input, so the specs 
#don't test require_sequence. The goal of require_sequence
# is to prompt the user to repeat back the new sequence 
#that was just shown to them, one color at a time. 
#If they give an incorrect color, it should immediately
# set @game_over to be true.
  end

  def add_random_color
    @seq << Simon::COLORS.sample
  end

  def round_success_message
    puts "You win the round!"
  end

  def game_over_message
    puts "you lose foo!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
