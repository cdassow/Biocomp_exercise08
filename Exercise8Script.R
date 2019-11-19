setwd("~/Desktop/biocomp-shell/Biocomp_exercise08/")

install.packages("ggplot2")
library(ggplot2)

#Question 1
UWMSU <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
UWMSUdf <- as.data.frame(UWMSU)

#Only UW data, make cumulative score vector, add that column to data frame
UW <- UWMSU[UWMSU$team=="UW",]
UWscorevec <-  c(UW$score)
UWcuml <- numeric(length(UWscorevec))
for (i in 1:length(UWscorevec)){
  UWcuml[i] <- sum(UWscorevec[1:i]) 
}
UW["cumlscore"] <- UWcuml

#Only MSU data, repeat process above for MSU scores
MSU <- UWMSU[UWMSU$team=="MSU",]
MSUscorevec <-  c(MSU$score)
MSUcuml <- numeric(length(MSUscorevec))
for (i in 1:length(MSUscorevec)){
  MSUcuml[i] <- sum(MSUscorevec[1:i]) 
}
MSU["cumlscore"] <- MSUcuml

#Merge two dataframes to one
newdata <- rbind(MSU,UW)

#Plot data (remember to install ggplot)
ex8graph <- ggplot(data=newdata, mapping=aes(x=time, y=cumlscore))
ex8graph+geom_line(aes(color=team), size=2)+xlab("Time (minutes)")+ylab("Points")+theme_classic()+
  scale_color_manual(values=c("palegreen4","red"))

#Question 2
#Write a game called “guess my number”. 
#Random number selected by computer

print("Guess a number between 1 and 100 until you get it right")
randomnumber <- sample(1:100,1)
for (i in 1:10){
  input <- as.numeric(readline())
  if (input>randomnumber){
    print("Lower")}
  else if (input<randomnumber){
    print("Higher")}
  else{
    print("Correct!")}
}

