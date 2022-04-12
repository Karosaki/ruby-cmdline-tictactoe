class Player
    attr_accessor :name, :player_number, :player_mark
  def initialize(name, player_number, player_mark)
    @name = name
    @player_number = player_number
    @player_mark = player_mark
  end

  def move(board)
    board[gets.chomp.to_i][gets.chomp.to_i] = player_mark 
  end
  def to_s
    "#{name} is player #{player_number} and has the mark #{player_mark}"
  end
end