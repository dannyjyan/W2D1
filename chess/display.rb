require 'colorize'
require_relative 'cursor.rb'
require_relative 'board.rb'
class Display 
    attr_reader :board
    def initialize(board)
      @board = Board.new
      @cursor = Cursor.new([0,5],board)
    end 

    def render
      board.rows.each_with_index do |row, x|
        curr_row = row.map { |p| p.inspect }
        str =  ""
        curr_row.each_with_index do |sq, y|
          next_sq = sq+ " "
          if @cursor.cursor_pos == [x,y]
            puts next_sq
            print next_sq.colorize(:red) 
          end 
          str += next_sq
        end
        puts str
      end

        # if @cursor.cursor_pos[0] == x
        #   curr_row[@cursor.cursor_pos[1]].colorize(:blue)
        # end
        # puts curr_row.join(" ")

    end 

  end