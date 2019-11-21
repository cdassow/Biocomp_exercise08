

#Variable which will be used to distinguish in for-loop if the player has already won. 
#Each round of guessing will only occur while correct==0, otherwise will loop through with no functions. 
correct <- 0

#Creates random number. 
game <- sample(1:100, size=1)
  
#For-loop distinguishes that the player has maximum 10 tries to guess.
  for(i in 1:10){
   
  #First time through loop introduces the game and requests the first guess.
  if(i==1){
    print("I am thinking of a number between 1 and 100. Try to guess it!")
    guess <- readline(prompt="Enter your guess:")
    
    #If/else statements change correct value if necessary, to prevent further guessing.
    #Also shows user if guess was too low or high.
    if(guess==game){
      correct <- 1
      print("Good job! You are correct!")
    } else if(guess>game){
      print("Incorrect! Your guess is too high.")
    } else{
      print("Incorrect! Your guess is too low.")
    }
    
#Runs for guesses 2-9; only occurs when the person has not yet guessed correctly (correct=0).
    } else if(i>1 & i<10 & correct==0){
      
#Repeat the guessing process from above for the intermediate loops.
      guess <- readline(prompt="Enter your a new guess:")
      if(guess==game){
       correct <- 1
       print("Good job! You are correct!")
      }else if(guess>game){
       print("Incorrect! Your guess is too high.")
      }else{
      print("Incorrect! Your guess is too low.")
      }

#For 10th round, clarifies that it is the last chance. No longer if-then distinctions of guess being too low or high. 
#Instead gives losing message. 
    } else if(i==10 & correct==0){
       guess <- readline(prompt="This is your last chance. Enter your guess:")
       if(guess==game){
        correct <- 1
        print("Good job! You are correct!")
       } else{
         print("You lose! Try again next time. ")
       }
    }
}




    



