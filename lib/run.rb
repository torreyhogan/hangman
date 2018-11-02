require 'yaml'
require_relative 'hangman.rb'

# game = Game.new 
# game.play

def load_game
	games = Dir["saves/*.yaml"]
	games.each { |file_name|  puts file_name }
	puts "which file would you like to open?"
	file = gets.chomp
	return loaded_game = YAML.load(File.read("saves/#{file}.yaml"))
	load_game.close
end

def save_game(game)
	puts "Please name your file: "
	user_name = gets.chomp
	file_name = "saves/#{file_name}.yaml"
	saves = File.open(file_name, "w")
	saves.write(game.to_yaml)
	saves.close
end

def start_up
	puts "New game, load game?: "
	user_input = gets.chomp
	if user_input == "new"
		game = Game.new 
		game.play
	elsif user_input == "load game"
		$saved = false
		# game = load_game
		# game.play

		games = Dir["saves/*.yaml"]
		games.each { |file_name|  puts file_name }
		puts "which file would you like to open?"
		file = gets.chomp
		file_name = "saves/#{file}.yaml"
		game = YAML.load(File.read(file_name))

		game.play
		

	end
	if $saved 
		# save_game(game)
		puts "Please name your file: "
		file_name = gets.chomp
		saves = File.open("saves/#{file_name}.yaml", "w")
		saves.write(game.to_yaml)
		saves.close





	end
	


end

start_up