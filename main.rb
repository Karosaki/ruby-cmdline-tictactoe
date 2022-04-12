require_relative 'Player'
require_relative 'Game'
require_relative 'Board'

player_a = Player.new("", 0, "")
player_b = Player.new("", 0, "")

game = Game.new(player_a, player_b)
game.play