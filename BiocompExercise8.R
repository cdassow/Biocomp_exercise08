#Part 1
#Load game data
data<-read.table("~/Biocomp/Biocomp_exercise08/UWvMSU_1-22-13.txt", header=TRUE)
#Separate data by team
UWdata<-data[data$team=="UW",]
MSUdata<-data[data$team=="MSU",]
#Create a column of cumulative scores over time for each team
UWdata$UWtotals<-cumsum(UWdata$score)
MSUdata$MSUtotals<-cumsum(MSUdata$score)
#Plot the data
plot(UWdata$time, UWdata$UWtotals, type="l", xlab="Time (min)", ylab="Cumulative score", col="red")+lines(MSUdata$time, MSUdata$MSUtotals, col="blue")

#Part 2
#Generate a random number stored as a
a<-sample(1:100,1)
#The function NumberGuess that runs 10 times
NumberGuess<-function(){
  for(i in 1:10){
    guess<-readline(prompt="Guess: ")
    if(a<guess){
      print("lower")
    }else{
      if(a>guess){
        print("higher")
      }else{
        if(a==guess){
          print("correct")
        }
      }
    }
  }
}
#Run the function
NumberGuess()
