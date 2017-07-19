require "pry"
require './lib/gameboard'
require './lib/player'
require './lib/computer'

class Battleship

  attr_reader :current_board, :player, :computer

  def initialize
    @instructions = "This is how you play battleship"
    @player = nil
    @computer = nil
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
    @computer.computer_board.print_board
  end

end
