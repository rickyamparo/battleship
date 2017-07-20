require 'pry'
require './lib/battleship'

bs = Battleship.new

while bs.player != nil
  bs.player_turn
  bs.computer_turn
  if bs.hit_check(bs.player.player_board.board) == 5
    print "The enemy won the game!!!"
    break
  elsif bs.hit_check(bs.computer.computer_board.board) == 5
    print "You have won the game!!!"
    break
  end
end
