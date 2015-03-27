class ATM

	attr_reader :name, :balance

	def initialize(name, balance = 100)
		@name = name
		@balance = balance.to_f

	end

	private

	def pin
		@pin = 1234
	end

	def pin_error
		add_trans
	end

	public

	def transaction
	require 'io/console' 

	line_width = 70
		
		puts
		puts ("Welcome to Ruby Banking, #{@name}.".center(line_width))
		puts
		puts ("Please enter your PIN: ".center(line_width))

		pin_number = STDIN.noecho(&:gets).chomp.to_i
	
		if pin_number == pin
			puts
			puts ("What would you like to do?".center(line_width))
			puts
			puts ("Enter 'B' to display your balance.".center(line_width))
			puts
			puts ("Enter 'D' to make a deposit.".center(line_width))
			puts
			puts ("Enter 'W' to make a withdrawal.".center(line_width))
			puts
			puts ("Enter 'E' to exit.".center(line_width))
		
		else
			puts pin_error
		end

		action = gets.chomp.to_s.downcase

		if action == "b" 
			display_balance

		elsif action == "d" 
			deposit
		
		elsif action == "w" 
			withdraw

		elsif action == "e"
			exit

		else
			invalid
	# need a cancel "or exit to cancel"			

		end

	end


	def display_balance

		line_width = 70

		puts ("Balance: $#{@balance}0".center(line_width))
		puts
		puts ("Would you like another transaction?".center(line_width))
		puts
		puts ("Please enter Yes or No.".center(line_width)) 

		another_trans = gets.chomp.to_s.downcase

		if another_trans == "y" or another_trans == "yes"
			add_trans
		elsif 
			another_trans == "n" or another_trans == "no"
			exit
		else
			invalid
		end

	end

	def deposit

		line_width = 70
		puts
		puts ("Please enter a deposit amount: $".center(line_width))

		amount = gets.chomp.to_f

		@balance += amount
		puts
		puts ("Deposit accepted. New balance: $#{@balance}.".center(line_width)) 
		puts 
		puts ("Would you like another transaction?".center(line_width))
		puts
		puts ("Please enter Yes or No".center(line_width))
		
			another_trans = gets.chomp.to_s.downcase

			if another_trans == "y" or another_trans == "yes"
				add_trans
			elsif 
				another_trans == "n" or another_trans == "no"
				exit
			else
				invalid
			end
	end

	def withdraw

		line_width = 70

		puts
		puts ("Please enter a withdrawal amount (in multiples of 20): $".center(line_width))

			amount = gets.chomp.to_f

			if amount % 20 != 0 || amount > @balance

				puts
				puts ("Invalid withdrawal amount. Please verify".center(line_width)) 
				puts ("that you have sufficient funds and that you".center(line_width)) 
				puts ("entered a multiple of 20.".center(line_width))

				withdraw

			elsif amount < @balance
				@balance -= amount
				puts
				puts ("Please take your cash.".center(line_width))
				puts
				puts ("New balance: $#{@balance}.".center(line_width))
				puts
				puts ("Would you like another transaction?".center(line_width))
				puts
				puts ("Please enter Yes or No.".center(line_width))
		
				another_trans = gets.chomp.to_s.downcase

				if another_trans == "y" or another_trans == "yes"
					add_trans
				elsif 
					another_trans == "n" or another_trans == "no"
					exit
				else
					invalid
				end
			
			end
	end

	def add_trans

		line_width = 70

		require 'io/console'

		puts
		puts ("Please re-enter your PIN: ".center(line_width)) 

		pin_number = STDIN.noecho(&:gets).chomp.to_i
	
		if pin_number == pin
			puts
			puts ("What would you like to do?".center(line_width))
			puts
			puts ("Enter 'B' to display your balance.".center(line_width))
			puts
			puts ("Enter 'D' to make a deposit.".center(line_width))
			puts
			puts ("Enter 'W' to make a withdrawal.".center(line_width))
			puts
			puts ("Enter 'E' to Exit.".center(line_width))
		
		else
			puts pin_error
		end

		action = gets.chomp.to_s.downcase

		if action == "b" 
			display_balance

		elsif action == "d" 
			deposit
		
		elsif action == "w" 
			withdraw

		elsif action =="e"
			exit

		else
			invalid
		
		end

	end

	def invalid

		line_width = 70

		puts
		puts ("Invalid selection.".center(line_width))
		
		add_trans
	end

	def exit
		line_width = 70
		puts
		puts ("Thank you for banking with Ruby.".center(line_width))
		puts
	end

end
		
test = ATM.new("Beth", 1000)
test.transaction



