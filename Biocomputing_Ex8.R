# Question 1

UW <- read.table("UWvMSU_1-22-13.txt", header=TRUE)

UWscores <- UW[UW$team=="UW",]
Mscores <- UW[UW$team=="MSU",]
UWscores$cumuscore1 <- cumsum(UWscores$score)
Mscores$cumuscore2 <- cumsum(Mscores$score)

plot(UWscores$time, UWscores$cumuscore1, type="l", col="blue", ylab="Score", xlab="Time (Minutes)")+
  lines(Mscores$time, Mscores$cumuscore2, col="violet")

# Question 2

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




