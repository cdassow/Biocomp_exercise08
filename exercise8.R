#exercise 8

#1. generate a graph from the UW vs. MSU game on 1/22/13

#generate a dataframe with a cumulative score for each team when they score
gameData <- read.delim("UWvMSU_1-22-13.txt")


UWScore <- 0
MSUScore <- 0

for(i in 1:50){
  if(gameData$team[i]=="UW"){
   print(gameData$score[i])
   
  }else{
    MSUScore <- MSUScore + gameData$score[i]
  }
}



UW <- data.frame(time=UWTime, score=UWScore)
MSU <- data.frame(time=MSUTime, MSUscore=MSUScore)

time <- gameData$time
timeFrame <- data.frame(x=time)



plot(UWTime,UWScore,type='l')
lines(MSUTime,MSUScore)


