#Plotting
library(ggplot2)
#load data
game<-read.table("./Biocomp_exercise08/UWvMSU_1-22-13.txt", header = TRUE, stringsAsFactors = FALSE)

#separating out the teams into two data sets
scoreUW<-game[which(game[,2]=="UW"),]
scoreMSU<-game[which(game[,2]=="MSU"),]

#making the y variable cumulative
scoreUW[,"points_scoredUW"]<-cumsum(scoreUW$score)
scoreMSU[,"points_scoredMSU"]<-cumsum(scoreMSU$score)

#categorizing the x variable
game[,"quarter"]<-game[,time=cut(time, breaks=c(0,10,20,30,40),labels=c("1st","2nd","3rd","4th"))]

ggplot() + 
  geom_line(data = scoreUW, aes(x = time, y = points_scoredUW), color = "red") +
  geom_line(data = scoreMSU, aes(x = time, y = points_scoredMSU), color = "green") +
  xlab('Quarter') +
  ylab('Points Scored')+
  theme_classic()

#Guess My Number game
readinteger <- function()
{ n <- readline(prompt="Guess here: ")
  if(!grepl("^[0-9]+$",n))
  {return(readinteger())
  }
  return(as.integer(n))
}

num <- round(runif(1) * 100, digits = 0)
guess <- 1

cat("Guess a number between 0 and 100.\n")
while(guess != num)
{ 
  guess <- readinteger()
  if (guess == num)
  {
    cat("Congratulations,", num, "is right.\n")
  }
  else if (guess < num)
  {
    cat("Try a larger number\n")
  }
  else if(guess > num)
  {
    cat("Try a smaller number\n")
  }
}

