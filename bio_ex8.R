# Biocomputing_E8

setwd("~/Documents/Biocomputing/Biocomp_exercise08/")

install.packages("ggplot2")
library(ggplot2)

# 1.) plot data
UWvMSU <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
UWvMSUdf <- as.data.frame(UWvMSU)

# Just MSU data - make cumulative score vector - add to dataframe

MSU <- UWvMSU[UWvMSU$team=="MSU",]
MSUscore <- c(MSU$score)
MSUcumscore <- numeric(length(MSUscore))
for (i in 1:length(UWscore)){
  MSUcumscore[i] <- sum(MSUscore[1:i])
}

MSU["cumulativescore"] <- MSUcumscore

# repeat above steps with UW

UW <- UWvMSU[UWvMSU$team=="UW",]
UWscore<- c(UW$score)
UWcumscore <- numeric(length(UWscore))
for (i in 1:length(UWscore)){
  UWcumscore[i] <- sum(UWscore[1:i])
}

UW["cumulativescore"] <- UWcumscore


# join dataframes from above
merged_data <- rbind(MSU,UW)

# I tried to right script just using plot function, but could not get a complete graph
# my work is shown below. I moved to suing ggplot because I understood that better from
# class. Hope that was okay!
## x<-c(merged_data$time)
## y<-c(merged_data$cumulativescore)
## plot(x,y,type='l', main="UWvsMSU", xlab="time(min)", ylab="cumulative points scored", 
## xcol="blue")

# plot for problem 1
timevcumscoregraph <- ggplot(data=merged_data, mapping=aes(x=time,y=cumulativescore))
timevcumscoregraph + geom_line(aes(color=team))+xlab("time(min)")+
  ylab("cumulative points scored")



# 2.) "Guess A Number" game - random number
a <-sample(1:100,1)
for(i in 1:10){
  input <- as.numeric(readline())
  if(input>a){
    print("Lower")}
  else if(input<a){
    print("Higher")}
  else if(input=a){
    print("Correct")}
}
