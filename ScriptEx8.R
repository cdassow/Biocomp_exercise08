##########Exercise 08########
### PART 1###
# set working directory
setwd("C:/Users/ceara/Desktop/Biocomputing2019/Biocomp_exercise08")

#load data
Scores<-data.frame(read.table(file="UWvMSU_1-22-13.txt", header = TRUE, sep ='\t'))

# separate teams into separate data frames
UW<-Scores[Scores$team=="UW", ]
MSU<-Scores[Scores$team=="MSU", ]

# get a list of all unique times
Times<-unique(Scores$time)
# complete the time sequence with 0 and 40 min
Missingtimes<-c(0, 40)
timesList<-append(Times, Missingtimes)
# make a new data frame with complete times
df<-data.frame(c(list(timesList)))
colnames(df)[1]<-"time" #change col name for merge

# create a df with all times and scores for each team
dfUW<-merge(df, UW, by="time", all=T)
dfMSU<-merge(df, MSU, by="time", all=T)

# replace NA with 0 for cumulative sum
dfMSU$score[is.na(dfMSU$score)] <- 0
dfUW$score[is.na(dfUW$score)] <- 0

# calculate cumulative sums
dfUW$ScoreSum<-cumsum(dfUW[, 3])
dfMSU$ScoreSum<-cumsum(dfMSU[,3])

#plot the scores
plot(dfMSU$time, dfMSU$ScoreSum, type="l", lwd=2, ylab= "Cumulative Score", xlab= "Minutes", xlim=c(0,40))
lines(dfUW$time, dfUW$ScoreSum, type="l", col="blue", lwd=2)
legend("bottomright", legend = c("MSU", "UW"), col = c("black","blue"), bty="o", fill= c("black","blue"))

########################################################
### PART 2 ###

# Guess my number game
guessMyNumber<-function(Guess){
  Nums<-seq(0,100,1)
  output<-sample(Nums, size=1)
  if(Guess==output){
    Answer <-"Correct!"
  }else if(Guess < output){
    Answer<-"Higher"
  }else if(Guess > output){
    Answer<-"Lower"
  }
  return(Answer)
}

guessMyNumber(Guess = 15) #any number input

