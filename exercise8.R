#exercise 8

#1. generate a graph from the UW vs. MSU game on 1/22/13

    #generate a dataframe with a cumulative score for each team when they score
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


  guessMyNumber <- function(number){
    randNum <- ceiling(runif(1, 1, 100))#runif(1,1,100) gives 1 number between 1 through 100, and ceiling rounds the random number to a whole number
     if(randNum>number){
      print("higher")
    }else if(randNum<number){
      print("lower")
    }else{
      print("correct!")
    }
}

  
  numguess <- c(1:10)
  guesses <- data.frame(NumOfGuess=numguess, Guess=numeric(length(numguess)), Answer=numeric(length(numguess)))
  guesses$Answer[i] <- randNum
  guesses$Guess[i] <- number

for(i in 1:10){
  replicate(10, {
            guessMyNumber <- function(number){
              randNum <- ceiling(runif(1, 1, 100))#runif(1,1,100) gives 1 number between 1 through 100, and ceiling rounds the random number to a whole number
              guesses$Answer[1:10] <- randNum
              guesses$Guess[i] <- number
              if(guesses$Answer[i]>guesses$Guess[i]){
                print("higher")
              }else if(guesses$Answer[i]<guesses$Guess[i]){
                print("lower")
              }else{
                print("correct!")
              }
            }})
}
