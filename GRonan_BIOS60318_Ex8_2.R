#*********************************************************************************************
# Author: George Ronan
# Date Edited: 20 November, 2019
# Create a "guess my number" game from 1-100
#*********************************************************************************************
nums <- c(1:100) # Initialize vector of integers 1-100
ans <- sample(x = nums,size = 1) # Randomly selects and stores a number
print("I'm thinking of a number from 1 to 100...")
for(i in 1:11){ # Allows for initial guess + 10 additional attempts
  guess <- readline(prompt = "Guess: ")
  if(i == 11){ # After 10 additional guesses, prints game over message and answer
    print("Incorrect, game over! I win!")
    cat("The answer was: ",ans)
  }else if(guess == ans){ # If guess is correct
    print("Correct!")
    options(warn=-1) # Suppresses warnings from using 'break'
    break # Exits loop
  }else if(guess < ans){ # If guess is too low
    print("Higher")
  }else if(guess > ans){ # If guess is too high
    print("Lower")
  }
}