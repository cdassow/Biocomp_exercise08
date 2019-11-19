setwd("~/Desktop/biocomp-shell/Biocomp_exercise08/")
install.packages("ggplot2")
library(ggplot2)

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

#Plot data
ex8graph <- ggplot(data=newdata, mapping=aes(x=time, y=cumlscore))
ex8graph+geom_line(aes(color=team), size=2)+xlab("Time (minutes)")+ylab("Points")+theme_classic()+
  scale_color_manual(values=c("palegreen4","red"))


