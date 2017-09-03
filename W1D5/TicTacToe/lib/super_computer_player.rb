require_relative 'tic_tac_toe_node'
require 'byebug'

class SuperComputerPlayer < ComputerPlayer

  # Move currently sees any winning move in the first tree and returns the first child
  # it never look =s past the first
  def move(game, mark)
    root = TicTacToeNode.new(game.board, mark, 0)
    best_kid = nil
    root.children.each do |node|
      return node.prev_move_pos if node.winning_node?(mark)
    end
    root.children.each do |node|
      return node.prev_move_pos unless node.losing_node?(mark)
    end
    raise 'Come On AI, do better!' if best_kid.nil?
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
