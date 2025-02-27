WIN_COMBINATIONS = [
  [0,1,2], 
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6],
  ]
  
  def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(board, index, character)
    board[index] = character
  end
  
  def position_taken?(board, index)
    !(board[index].nil? || board[index] == " ")
  end
  
  def valid_move?(board, index)
    if index.between?(0,8) && !position_taken?(board,index)
     true
    else
    end
  end
  
 def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.strip
  
  user_index = input_to_index(user_input)
    if valid_move?(board, user_index)
      move(board, user_index, current_player(board))
      display_board(board)
    else
      turn(board)
    end
  end
  
  def turn_count board
    board.count {|character| character == "X" || character == "O"}
  end

def current_player(board)
   turn_count(board).even? ? "X" : "O"
end
  
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end 

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  if winning_combination = won?(board)
    board[winning_combination.first]
  end
end
  
def play(board)
  turn(board) until over?(board)
  if won?(board)
    puts "Congratulations #{winner(board)}!"
  elsif draw?(board)
    puts "Cat's Game!"
  end
end
  
  
  
  