WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], #Bottom row
  [0,3,6], #First row
  [1,4,7], # Second row
  [2,5,8], #Third row
  [0,4,8], #First Diagonal
  [6,4,2] #Second Diagonal
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
   board[location] != " "
end

def valid_move?(board, position)
  if position.to_i.between?(1,9)
    if !position_taken?(board, position.to_i-1)
      true
    end
end
end

def turn(board)
   puts "Please enter 1-9:"
   input = gets.strip
   if valid_move?(board, input)
     move(board, input)
   else
     turn(board)
   end
   display_board(board)
end

def turn_count(board)
  turns = 0
  board.each do |marker|
    if marker == "X" || marker == "O"
    turns += 1
    end
  end
turns
end

def current_player(board)
  if turn_count(board).even?
    "X"
  else
    "O"
  end
end

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
 end

def full?(board)
  board.all? do |marker|
    marker == "X" || marker == "O"
end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
end
end

def play(board)
  while !over?(board)
    turn(board)
    if winner(board) == "X"
      puts "Congratulations X! You are the winner!"
    end
end
end