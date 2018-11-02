class Game

	def initialize
		@word = word_from_dictionary
		@guesses = 6
		@user_guess =  []
		$saved = false
	end

	def word_from_dictionary
		words = []
		File.open("5desk.txt").each do |word|
			words << word 
		end
		random_word_idx = rand(words.length - 1)
		words[random_word_idx].split('')
	end

	def display_board
		puts "Guesses: #{display_guesses}"
		puts "You have #{@guesses} turns left."
		puts correct_guesses
		
	end

	def user_guess
		puts "Please enter a single letter guess: "
		letter = gets.chomp
		letter.downcase!
		while !valid_guess?(letter)
			puts "Please enter a valid guess."
			letter = gets.chomp
		end
		if letter == "save"
			$saved = true
		elsif !@word.include?(letter)
			@user_guess << letter
			@guesses -= 1 
		else
			@user_guess << letter
		end
	end

	def valid_guess?(letter)
		(letter =~ /[[:alpha:]]/ && !@user_guess.include?(letter) && letter.length == 1) || letter == "save" 
	end


	def correct_guesses
		display = ""
		@word.each do |letter|
			if @user_guess.include?(letter)
				display += "#{letter} "
			else
				display += "_ "
			end
		end
		display
	end

	def display_guesses
		display = ""
		@user_guess.sort!
		@user_guess.each do |letter|
			display += "#{letter} "
		end
		display
	end

	def winner?
		logic = @word.all? do |letter|
			@user_guess.include?(letter)
		end
		logic
	end


	def play
		while @guesses > 0 && !winner? && !$saved
			display_board
			user_guess
		end
		display_board
		if winner?
			puts "You win!!"
		elsif $saved
			puts "Saving game..."
		elsif @guesses == 0
			puts "You ran out of guesses! You lose!!"
		end

	end

end















