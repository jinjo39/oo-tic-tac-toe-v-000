class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player = "X")
    @board[index] = player
  end

  def position_taken? (index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if position_taken?(index)  == false && index.between?(0,8)
      return true
    else
      return false
    end
  end

  def turn
  puts "Please enter 1-9:"
  index = gets.strip
  until valid_move?(index)
    puts "Please enter 1-9:"
    index = gets.strip
  end
    char = current_player
    move(index, player = "X")
    display_board
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
end
