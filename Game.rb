require_relative 'Player'
require_relative 'Board'

class Game
  attr_accessor :player_a, :player_b
  def initialize(player_a, player_b)
    @player_a = player_a
    @player_b = player_b
  end

  # Method that sets the player's name as the input
  def set_player_name(player_a, player_b)
    puts "First player, what is your name?"
    player_a.name = gets.chomp
    puts "Second player, what is your name?"
    player_b.name = gets.chomp
  end

  # Picks the player's number
  def pick_player_number(player_a, player_b)
    x = rand(1..2)
    if x == 1
        player_a.player_number = 1
        player_a.player_mark = "X"

        player_b.player_number = 2
        player_b.player_mark = "O"
    else
        player_a.player_number = 2
        player_a.player_mark = "O"

        player_b.player_number = 1 
        player_b.player_mark = "X"
    end
  end

  # Output the to_s method of the player class for both players in the game
  def put_player_info(player_a, player_b)
    puts player_a
    puts player_b
  end

  def player_move(player, board)
    # Prompt and get player input
    puts "#{player.name}, please enter the array co-ordinates of the square you would like to mark [0,0] being TOP LEFT, entering x-coord first"
    player_x_coord = gets.chomp.to_i
    player_y_coord = gets.chomp.to_i
    # Check if the square is empty
    if board.board[player_x_coord][player_y_coord] == nil
      board.board[player_x_coord][player_y_coord] = player.player_mark
    else # If not empty, prompt again and direct back to this function
      puts "That square is already taken, please try again"
      player_move(player, board)
    end
  end

  def print_win_statement(player)
    puts "#{player.name} wins!"
  end

  def check_game_state(board, player)
    # Check if there is a winner
    # Horizontal wins
    if board.board[0][0] == board.board[0][1] && board.board[0][1] == board.board[0][2] && board.board[0][0] != nil
      print_win_statement(player)
      return "Win"
    elsif board.board[1][0] == board.board[1][1] && board.board[1][1] == board.board[1][2] && board.board[1][0] != nil
      print_win_statement(player)
      return "Win"
    elsif board.board[2][0] == board.board[2][1] && board.board[2][1] == board.board[2][2] && board.board[2][0] != nil
      print_win_statement(player)
      return "Win"
    # Vertical wins
    elsif board.board[0][0] == board.board[1][0] && board.board[1][0] == board.board[2][0] && board.board[0][0] != nil
      print_win_statement(player)
      return "Win"
    elsif board.board[0][1] == board.board[1][1] && board.board[1][1] == board.board[2][1] && board.board[0][1] != nil
      print_win_statement(player)
      return "Win"
    elsif board.board[0][2] == board.board[1][2] && board.board[1][2] == board.board[2][2] && board.board[0][2] != nil
      print_win_statement(player)
      return "Win"
    # Diagonal wins
    elsif board.board[0][0] == board.board[1][1] && board.board[1][1] == board.board[2][2] && board.board[0][0] != nil
      print_win_statement(player)
      return "Win"
    elsif board.board[0][2] == board.board[1][1] && board.board[1][1] == board.board[2][0] && board.board[0][2] != nil
      print_win_statement(player)
      return "Win"
    end
  end
  
  def game_loop(player_a, player_b)
    # Create a board
    board = Board.new
    # Create a variable that will keep track of the current amount of moves
    moves = 0
    # Case if player a is player 1
    if player_a.player_number == 1
      while moves <= 8
        player_move(player_a, board)
        board.display_board
        break if check_game_state(board, player_a) == "Win"
        moves += 1
        break if moves == 9
        player_move(player_b, board)
        board.display_board
        break if check_game_state(board, player_b) == "Win"
        moves += 1
      end
    # Case if player b is player 1
    else
      while moves <= 8
        player_move(player_b, board)
        board.display_board
        break if check_game_state(board, player_b) == "Win"
        moves += 1
        break if moves == 9
        player_move(player_a, board)
        board.display_board
        break if check_game_state(board, player_a) == "Win"
        moves += 1
      end
    end

    puts "It's a Draw!"
  end

  def play
    self.pick_player_number(player_a, player_b)
    self.set_player_name(player_a, player_b)
    self.put_player_info(player_a, player_b)
    self.game_loop(player_a, player_b)
  end
end