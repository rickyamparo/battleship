require 'pry'
require './lib/battleship'

bs = Battleship.new
bs.create_players
bs.player_turn
bs.computer_turn
