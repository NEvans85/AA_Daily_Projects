require_relative 'skeleton/lib/00_tree_node.rb'
require 'byebug'

class KnightPathFinder

  attr_reader :position, :move_tree, :board, :visited_positions

  def initialize(init_pos)
    @init_pos = init_pos
    @visited_positions = [init_pos]
    @move_tree = build_move_tree
    @board = Array.new(8) { Array.new(8) }
  end

  def build_move_tree
    root = PolyTreeNode.new(@init_pos)
    queue = [root]
    tree = [root]
    until queue.empty?
      parent = queue.shift
      new_move_positions(parent.value).each do |pos|
        child = PolyTreeNode.new(pos)
        child.parent = parent
        queue << child
        tree << child
      end
    end
    tree
  end

  def find_path(pos)
    trace_path_back(@move_tree.first.bfs(pos))
  end

  def trace_path_back(node)
    return [node.value] if node.parent.nil?
    trace_path_back(node.parent) + [node.value]
  end

  def new_move_positions(pos)
    # debugger
    unvisited_positions = valid_moves(pos).reject do |valid_pos|
      @visited_positions.include?(valid_pos)
    end
    @visited_positions += unvisited_positions
    unvisited_positions
  end

  def valid_moves(pos)
    x, y = pos
    all_possible = [[x - 2, y - 1], [x - 1, y - 2],
                    [x - 2, y + 1], [x + 1, y - 2],
                    [x + 2, y - 1], [x - 1, y + 2],
                    [x + 2, y + 1], [x + 1, y + 2]]
    all_possible.select { |p_pos| p_pos.all? { |el| (0..7).cover?(el) } }
  end


end
