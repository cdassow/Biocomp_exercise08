# Exercise 08
# Starting in Biocomp_exercise08 folder cloned from Github
# Part 1
# UWisconsin Scoring Plays
uW <- UWvMSU_1.22.13[UWvMSU_1.22.13$team=="UW",]
# MSU in Scoring Plays
msu <- UWvMSU_1.22.13[UWvMSU_1.22.13$team=="MSU",]
# Use cummulative summation function to create the sum score for each team
uW[,3] <- cumsum(uW[,3])
msu[,3] <- cumsum(msu[,3])
# Isolate the time and score columns into a subset
uWplotData <- subset.data.frame(uW, select = c(time, score))
msuplotData <- subset.data.frame(msu, select = c(time, score))
# Plot the Scores
plot(msuplotData, type="l")
# Plot a second line for the Wisconsin scoring data and make the line red
lines(uWplotData, type="l", col="red", main="UW vs. MSU Score Summary")

# Part 2
# Using a poisson distribution to generate the random number
# Set up random number for user to attempt to guess
x <- as.integer(runif(1,1,100))
# Set initial value for the variable guess to be used in the loop
n <- 102
# Set variable for counting the number of guesses
g <- 1

# Run a conditional loop prompting the user to guess and play the game
print("Guess my number between 1 and 100")
# Use a conditional loop to change response depending on the input value - simpler in this case than a for loop
# Use function readline() to give user instructions and force an additional input (issue with our initial loop)
while(n != x){
  n <- readline(prompt = "Enter Guess: ")
  # This conditional loop will work so the game can both stop when the answer is correct, and continue until the user has guessed 10 times
  if (n == x){
    cat("Correct!")
    g <- 1
  }
  else if (x > n){
    # This loop within the loop is needed here to stop the game after 10 guesses before the prompt is given again
    if (g == 10){
      cat("Out of guesses. Play again")
      # This line is to reset the game and make sure the next user only gets 10 guesses too
      g <- 1
      # Break ends the loop and therefore ends the game.
      break()
    }
    cat("Higher")
    # The value for the number of guesses is increased by one for each wrong attempt
    g <- g+1
  }
  # This part of the loop has the same functionality and reasoning as the other else if argument
  else if (x < n){
    if (g == 10){
      cat("Out of guesses. Play again")
      g <- 1
      break()
    }
    cat("Lower")
    g <- g+1
  }
}