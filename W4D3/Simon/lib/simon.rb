class Simon
  COLORS = %w(red blue green yellow purple orange pink black white brown)

  # attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until @game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    print_colors
    system("clear")
  end

  def print_colors
    @seq.each do |color|
      system("clear")
      puts ' '
      sleep(0.5)
      system("clear")
      puts color 
      sleep(0.75)
    end
  end

  def require_sequence
    puts "Enter the series of #{@sequence_length} colors seperated by a comma"
    input = gets.chomp.split(",")
    valid_input(input)
    input.each_with_index do |color, idx|
      @game_over = true unless color.strip == @seq[idx]
    end
  end

  def valid_input(input)
    until input.length == @sequence_length
      puts "That doesn't seem to be a valid input"
      puts "please make sure to add all #{@sequence_length} color(s) with a comma in between"
      puts " e.g: #{random_sequence_example}"
      input = gets.chomp.split(",")
    end
  end

  def random_sequence_example
    Array.new(@sequence_length) { COLORS.sample }.join(',')
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "All colors were correct! Good Job!"
  end

  def game_over_message
    puts "Congratulations you remebered #{@sequence_length} colors!"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end


Simon.new.play
