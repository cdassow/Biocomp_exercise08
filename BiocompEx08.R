#Plotting
score<-read.table("./Biocomp_exercise08/UWvMSU_1-22-13.txt", header = TRUE)
scoreUW<-score[which(score[,2]=="UW"),]
scoreMSU<-score[which(score[,2]=="MSU"),]

#how did i get scoreSum to do what i wanted before??
scoreSumUW=
scoreSumMSU=

# Generate some data
x<-score$time
y1<-scoreUW$scoreSum
y2<-scoreMSU$scoreSum
plot(x, y1, type="l", pch=19, col="red", xlab="Time", ylab="Score")
# Add a line
lines(x, y2, pch=18, col="green", type="l", lty=1)
# Add a legend
legend(1, 95, legend=c("UW", "MSU"),
       col=c("red", "green"), lty=solid, cex=0.8)

#Guess My Number game
n<-sample(1:100, 1, replace = TRUE)
x<- readline(prompt = "Guess: ")
if (x>n){
  print("Lower")
}else if (x<n){
  print("Higher")
}else{
  print("Correct!")
}
#get the script to go back to readline() after "lower" or "higher"
