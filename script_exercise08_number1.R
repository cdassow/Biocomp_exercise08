
#Loading the file into R as a dataframe
gamescore <- read.delim("UWvMSU_1-22-13.txt")

#setup steps
#Set the scores at the beginning of the game for each team to zero
UWtotal <- 0
MSUtotal <- 0
#Create the new dataframes for the results to go into with a column each for time, UW cummulative scores, MSU commulative scores
x <- c("time","UW.Score","MSU.Score")
cumulative <- data.frame(matrix(ncol=3,nrow=50))
colnames(cumulative) <- x

#Adds the correct times to the resulting dataframe
cumulative$time <- gamescore$time
#For loop used to filter through each line of the file
for(i in 1:50){

  #first conditional to add to the cumulative sum of UW, insert that value into new dataframe
  if(gamescore$team[i]=="UW"){
    UWtotal <- UWtotal+gamescore[i,3]
    cumulative[i,2] <- UWtotal
  }
  #all other scores are MSU, adds these cumulative scores, inserts value into new datafram
  else{
    MSUtotal <- MSUtotal+gamescore[i,3]
    cumulative[i,3] <- MSUtotal
  }
}
#plotting results, first makes a matrix for each team, then plots them
UWplot <- cumulative[is.na(cumulative$MSU.Score),1:2]
columns <- c(1,3)
MSUplot <- cumulative[is.na(cumulative$UW.Score),columns]

#Makes the MSU plot blue, UWplot Black
plot(UWplot,type="l", main="Cumulative Scores for MSU and UW",ylab="Score")+lines(MSUplot, col="blue")




