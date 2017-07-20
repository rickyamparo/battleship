require 'pry'
require './lib/battleship'

bs = Battleship.new
turns = 0
while bs.player != nil
  bs.player_turn
  bs.computer_turn
  turns += 1
  if bs.hit_check(bs.player.player_board.board) == 5
    print "The enemy won the game!!!"
    break
  elsif bs.hit_check(bs.computer.computer_board.board) == 5
    print "You have won the game!!!"
    break
  end
end
puts "\nThis game took " + turns.to_s + " turns"
