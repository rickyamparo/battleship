require "pry"
require './lib/gameboard'
require './lib/player'
require './lib/computer'

class Battleship

  attr_reader :current_board, :player, :computer, :computer_choices

  def initialize
    @instructions = "This is how you play battleship"
    @player = nil
    @computer = nil
    @computer_choices = *(0...16)
    puts "Would you like to (p)lay a game of Battleship? Read the (i)nstructions or (q)uit?"
  end

  def start_sequence
    player_choice = gets.chomp
    if player_choice == "i"
      puts @instructions
      start_sequence
    elsif player_choice == "q"
      puts "You have quit the game"
      #design a way for players to quit
    elsif player_choice == "p"
      puts "Let's play a round of battleship"
      create_players
    else
      puts "Please pick one of the three choices"
      puts "(p)lay, (i)nstructions or (q)uit"
      start_sequence
    end
  end

  def create_players
    @player = Player.new
    @computer = Computer.new
    puts "Both players have set their board."
  end

  def player_turn
    puts "where would you like to shoot?"
    guess = gets.chomp
    @computer.computer_board.board[@computer.computer_board.idmap[guess]].space_hit
    puts "Enemy Board"
    @computer.computer_board.print_board
    hit_check(@computer.computer_board.board)
  end

  def computer_turn
    random_hit = @computer_choices.sample
    @player.player_board.board[random_hit].space_hit
    @computer_choices.delete(random_hit)
    puts "\n" + "Your board"
    @player.player_board.print_board
    hit_check(@player.player_board.board)
  end

  def hit_check(board)
    hit_tracker = 0
    board.each do |space|
      if space.status == " [H] "
        hit_tracker += 1
      end
    end
    puts "This player has been hit #{hit_tracker} times."
  end



end
