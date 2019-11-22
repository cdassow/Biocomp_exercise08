#Question One
#These steps read in the table and create separate files for UW and MSU data
UWvMSU<- read.table("UWvMSU_1-22-13.txt", header=TRUE)
UWScores<-UWvMSU[UWvMSU[,2]=="UW",]
MSUScores<-UWvMSU[UWvMSU[,2]=="MSU",]

#These steps cumulatively sum the scores in each data set so the data can be plotted
UWScores$cumuscore1<-cumsum(UWScores$score)
MSUScores$cumuscore2<-cumsum(MSUScores$score)

#This step plots the score vs time in the game, labels the axes, and selects the colors of the lines  
plot(UWScores$time, UWScores$cumuscore1, type="l", col="blue", ylab="Score", xlab="Time (Minutes)")+
  lines(MSUScores$time, MSUScores$cumuscore2, col="chartreuse")

#Question Two

num<-sample(1:100, size = 1)
print("I'm thinking of a number from 1-100...")

for(i in 1:10){
  rand<-num
  g <- readline(prompt = "guess? ")
  if(g<rand){
    print("higher")
  }else if(g>rand){
    print("lower")
  }else{
    print("Correct!")
  }
}

