
class Queen

  attr_accessor :parent, :pos, :children
  def initialize(pos, parent)
    @pos = pos
    @parent = parent
    @children =[]
  end

  def find_children(board_length)
    children = []
    (0...board_length).each do |row_idx|
      (0...board_length).each do |col_idx|
        board = Board.populate(self.find_path)
        children << Queen.new([row_idx, col_idx], self) if board.valid_board?(row_idx, col_idx)
      end
    end
    @children = children
  end


  def find_path
    path = [self]
    until path.last.parent.nil?
      path << path.last.parent
    end
    path
  end

  def row
    @pos[0]
  end

  def col
    @pos[1]
  end

  def self.start_queens
    queens = []
    (0..7).each do |row|
      (0..7).each do |col|
        queens << Queen.new([row, col], nil)
      end
    end
    queens
  end

end

class Solver
  def initialize(num_queens)
    @num_queens = num_queens
    @queue = Queen.start_queens
    @solutions = []
  end



  def solve

    until @queue.empty?
      curr_queen = @queue.shift
      children = curr_queen.find_children(@num_queens)
      @solutions += children.select { |child| child.find_path.length == @num_queens }

      @queue.push(*children.reject { |child| child.find_path.length == @num_queens })
    end
    @solutions
  end
end

class Board
  def initialize(grid = Array.new(8) { Array.new(8) })
    @grid = grid
  end

  def self.populate(queens)
    grid = Array.new(8) { Array.new(8) }
    queens.each do |queen|
      grid[queen.row][queen.col] = true
    end

    Board.new(grid)
  end

  def valid_board?(row, col)
    row_valid?(row, col) && col_valid?(row, col) && diag_valid?(row, col)
  end

  def row_valid?(row, col)
    @grid[row].none? { |el| el == true }
  end

  def col_valid?(row, col)
    @grid.transpose[col].none? { |el| el == true }
  end

  def diag_valid?(row, col)
    positions = []
    [[1, 1], [-1, -1], [1, -1], [-1, 1]].each do |delta|
      curr_row, curr_col = row + delta[0], col + delta[1]
      until @grid[curr_row].nil? || @grid[curr_row][curr_col].nil?
        positions << [curr_row, curr_col]
        curr_row, curr_col = curr_row + delta[0], curr_col + delta[1]
      end
    end
    positions.none? { |pos| @grid[pos[0]][pos[1]] == true }
  end


end

if __FILE__ == $PROGRAM_NAME
  Solver.new(8).solve
end
