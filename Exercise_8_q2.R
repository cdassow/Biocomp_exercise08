#Exercise 8 Stephen Grisoli

#Number guessing game
#-----------------------------------------------------------------------------------------------#
#Generate random number
answer = floor(runif(1,1, 101))

#interator for the number of guesses
num_of_guesses = 0

#while loop to compare to guess to answer
while(num_of_guesses<10){
  guess = readline(prompt = "Guess an integer between 1 and 100: ")
  guess = as.numeric(guess)
  num_of_guesses = num_of_guesses + 1
    if(guess==answer){
      cat("You won in:",num_of_guesses, "guesses!")
      break
    } else if(guess>answer){
      print("Lower!")
    } else if(guess<answer){
      print("Higher!")
    }
}
if(num_of_guesses==10){
  print("How did you lose? Guessing strategy allows win in at most 7 guesses")
  cat("The answer was: ",answer)
}