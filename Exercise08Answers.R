rm(list=ls()) #clears environment

library(ggplot2)
library(cowplot)
library(reshape2)

# 1. U Wisco vs Michigan State Basketball Graph
data<-read.table("~/Desktop/Biocomp/Biocomp_exercise08/UWvMSU_1-22-13.txt", sep='\t', header=T, stringsAsFactors = F)

WiscoData = data[data$team=="UW",] #Separating data by team, and checking final score
#sum(WiscoData$score)
MSUData = data[data$team=="MSU",]   
#sum(MSUData$score)
# Final score should be UW 47, MSU 49

WiscoSum=0 #Initializes score at beginning of game
MSUSum=0


for (i in 1:nrow(WiscoData)){             #Goes through each row of UW data, making score column cumulative
  WiscoSum = WiscoData$score[i]+WiscoSum
  WiscoData$score[i]=WiscoSum
}
x=WiscoData$time  #Sets x-axis equal to time UW scored
y=WiscoData$score #Sets y-axis equal to cumulative score
plot(x,y,"l", col="red", xlab="time (min)", ylab="score", main="UW vs MSU Basketball Game") #Plots UW score as red line

for (i in 1:nrow(MSUData)){               #Do same for MSU
  MSUSum = MSUData$score[i]+MSUSum
  MSUData$score[i]=MSUSum
}
x2=MSUData$time
y2=MSUData$score

lines(x2,y2,"l", col="green") #Plots MSU score as green line on same plot

#2. Guess My Number Game
vector=1:100 #creates vector of 1-100
guess=sample(vector, 1) #randomly chooses a number from that vector

cat("I'm thinking of a number from 1-100.")
for(i in 1:10){
  answer=readline(prompt="Guess: ")
  if (answer==guess){
    cat("Correct!")
    break
  }else if (answer<guess){
    cat("Higher")
  }else if (answer>guess){
    cat("Lower")
  }
}
