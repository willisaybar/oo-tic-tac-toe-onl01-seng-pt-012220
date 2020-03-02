require 'pry'

class TicTacToe

  attr_accessor :board

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], # top_row
  [3,4,5], # middle_row
  [6,7,8], # bottom_row
  [0,3,6], # left_column
  [1,4,7], # center_column
  [2,5,8], # right_column
  [0,4,8], # left_diagonal
  [6,4,2] # right_diagonal
  ]

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
  @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(move)
       move.to_i - 1
    end

    def move(position, token)
      @board[position] = token
    end

    #because of question mark its true or false
    def position_taken?(position)
      #find position board
      #read the position
      #check if its taken or not, player 1 X, player 2 O, or empty " "
      if @board[position] == " "
        return false
      else
        return true
      end
    end

    def valid_move?(position)
      if position_taken?(position) == true
        return false
      end

      if position >= 0 && position <= 8
        return true
      else
        return false
      end
    end

    def turn
      position = input_to_index(gets)
      if valid_move?(position) == true
        move(position, current_player)
        display_board
      else
        turn
      end

    end

    def full?
      if @board.count{|token| token == " "} >= 1
        return false
      else
        true
      end
    end



end
