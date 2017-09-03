require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    return @board.winner != evaluator if @board.won?
    if @next_mover_mark != evaluator
      children.any? { |node| node.losing_node?(evaluator) }
    else
      children.all? { |node| node.losing_node?(evaluator) }
    end
  end

  # def winning_node?(evaluator)
  #   queue[self]
  #   until queue.empty?
  #     test_node = queue.shift
  #     return test_node.board.winner == evaluator if test_node.board.won?
  #     test_node.children.each { |kid| queue << kid }
  #   end
  # end
  def winning_node?(evaluator)
    return @board.winner == evaluator if @board.won?
    children.any? { |node| node.winning_node?(evaluator) }
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    @board.rows.each_with_index do |row, r_idx|
      row.each_index do |c_idx|
        kid_board = @board.dup
        pos = [r_idx, c_idx]
        if kid_board.empty?(pos)
          kid_board[pos] = @next_mover_mark
          children << TicTacToeNode.new(kid_board, next_mark, pos)
        end
      end
    end
    children
  end

  def next_mark(mark = @next_mover_mark)
    case mark
    when :x
      :o
    when :o
      :x
    end
  end

end
