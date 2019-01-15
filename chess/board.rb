class Board 
  attr_reader :rows
  def initialize
    @rows = Array.new(8){Array.new(8)}
    populate_board
  end 

  def [](pos)
    x,y = pos 
    rows[x][y]
  end 



  def []=(pos,val)
    x,y = pos 
    rows[x][y] = val
  end
 
  def populate_board
    (0...rows.length).each do |col| # row 0
      rows[0][col] = Piece.new 
      rows[1][col] = Piece.new 
      rows[6][col] = Piece.new 
      rows[7][col] = Piece.new 
    end 
  end 

  def move_piece(start_pos, end_pos)
    start_piece = self[start_pos]
    raise ArgumentError.new("Invalid start position") if start_piece.nil?

    raise ArgumentError.new("Index out of bounds") if valid_pos?(start_pos) && valid_pos?(end_pos)
    self[start_pos], self[end_pos] = nil, self[start_pos] 
  end
  
  def valid_pos?(pos)
    pos[0] > 7 || pos[0] < 0 || pos[1] > 7 || pos[1] < 0
  end
end 

class Piece
  def inspect
    "p"
  end
end 

board = Board.new 
p board.rows
p board.move_piece([1,3], [3,3])
p board
