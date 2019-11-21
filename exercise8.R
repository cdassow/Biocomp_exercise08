#exercise 8

#1. generate a graph from the UW vs. MSU game on 1/22/13

gameData <- read.delim("UWvMSU_1-22-13.txt")

    #create a data frame with 3 columns: time (starting at 0), UW scores (blank to fill in later), and MSU scores (blank to fill in later)
df <- data.frame(time=c(0,gameData$time), UW=numeric(length(gameData$time)+1), MSU=numeric(length(gameData$time)+1))

    #start at row 2, because this is the first actual score, since the data frame begins with time=0 in row 1
for(i in 2:51){
  if(gameData$team[i-1]=="UW"){
   df$UW[i] <- gameData$score[i-1] + df$UW[i-1]  #if UW scores, add the new score to their previous total
   df$MSU[i] <- df$MSU[i-1]  #if MSU doesn't score, move the previous total score down to the new row
  }else{
    df$MSU[i] <- gameData$score[i-1] + df$MSU[i-1]  #if MSU scores, add the new score to their previous total
    df$UW[i] <- df$UW[i-1]  #if UW doesn't score, move the previous total score down to the new row
  }
}

    #create a line graph with the data, using red to denote UW scores and green to denote MSU scores
plot(df$time,df$UW,col="red",col.lab="black",type='l',main="UW vs. MSU Basketball Game 1/22/13",xlab="Time (minutes)",ylab="Score")
lines(df$time,df$MSU,col="green")
legend("bottomright",legend=(c("UW","MSU")),text.col=c("red","green"))


#2. write a game where the computer generates a number 1-100, and user guesses a number
    #if random number is lower than the guess, computer replies "lower"
    #if random number is higher than the guess, computer replies "higher"
    #if the guess is correct, computer replies "correct!"
    #the player can guess up to 10 times

#setup:
    
    #function that displays "higher", "lower", or "correct" after each guess
  guessMyNumber <- function(num, randNum){
     if(randNum>num){
      return("higher")
    }else if(randNum<num){
      return("lower")
    }else{
      return("correct!")
    }
  }
  
  
#game:
  
    #generate 1 random number rounded to an integer between 1 and 100
    #give user 10 guesses, print response given by the guessMyNumber function
    #if number is guessed correctly, end the loop
  randNum <- ceiling(runif(1, 1, 100))
  for(i in 1:10){
    num <- as.integer(readline(prompt = "guess a number!"))
    response <- guessMyNumber(num, randNum)
    print(response)
    if(response=="correct!"){
      break
    }
  }
