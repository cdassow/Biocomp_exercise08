#exercise 8

#1. generate a graph from the UW vs. MSU game on 1/22/13

#generate a datagrame with a cumulative score for each team when they score
gameData <- read.delim("UWvMSU_1-22-13.txt")

UWscore <- 0
MSUScore <- 0

for(i in 1:nrow(gameData)){
  if(gameData$team[i]=="UW"){
    UWScore <- UWScore + gameData$score[i]
  }else{
    MSUScore <- MSUScore + gameData$score[i]
  }
}


UWScore <- 0
MSUScore <- 0

for(i in 1:nrow(gameData)){
  if(gameData$team[i]=="UW"){
    UWScore <- cumsum(gameData$score[1:50])
  }else{
    MSUScore <- cumsum(gameData$score[1:50])
  }
}




