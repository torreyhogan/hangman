require 'yaml'
require_relative 'hangman.rb'


def load_game
	$saved = false
	games = Dir["saves/*.yaml"]
	games.each { |file_name|  puts file_name }
	puts "which file would you like to open?"
	file = gets.chomp
	file_name = "saves/#{file}.yaml"
	while !File.exist?(file_name)
		puts "Please enter a filename that exists"
		file = gets.chomp
		file_name = "saves/#{file}.yaml"
	end
	game = YAML.load(File.read(file_name))
	game.play
end

def save_game(game)
	puts "Please name your file: "
	user_name = gets.chomp
	file_name = "saves/#{user_name}.yaml"
	saves = File.open(file_name, "w")
	saves.write(game.to_yaml)
	saves.close
end

def start_up
	puts "Welcome to Hangman."
	puts "Type \"save\" anytime to save game."
	puts "New game, load game?: "
	user_input = gets.chomp
	if user_input == "new game"
		game = Game.new 
		game.play
	elsif user_input == "load game"
		load_game
	end
	if $saved 
		save_game(game)
	end
end

start_up