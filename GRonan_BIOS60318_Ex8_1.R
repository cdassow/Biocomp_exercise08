#******************************************************************************************
# Author: George Ronan
# Date Edited: 20 November, 2019
# Purpose: Using the score-by-score information from this game summarized in 
# UWvMSU_1-22-13.txt generate a graph similar to the one I show above.
#******************************************************************************************
data <- read.table(file = "UWvMSU_1-22-13.txt", # Read in UWvMSU file as a table of data
                   header = TRUE,stringsAsFactors = FALSE) # Accounts for headers, strings
UWsum <- matrix(data = 0,nrow = nrow(data),ncol = 2) # Initialize 2-col output matrix
MSUsum <- matrix(data = 0,nrow = nrow(data),ncol = 2) # Initialize 2-col output matrix
for(i in 1:nrow(data)){
  UWsum[i,1] <- data$time[i] # Store timepoint at score in UW score matrix
  UWsum[i,2] <- sum(na.omit(data[1:i,][data$team == "UW",3])) # Store corresponding sum of
                                                              # previous UW point additions
                                                              # i.e. corresponding sum
  MSUsum[i,1] <- data$time[i] # Store timepoint at score in MSU score matrix
  MSUsum[i,2] <- sum(na.omit(data[1:i,][data$team == "MSU",3])) # Store corresponding sum of
                                                                # all previous UW point
                                                                # additions
                                                                # i.e. corresponding sum
}
cumscores <- cbind(UWsum,MSUsum[,2]) # Combines both time/score matrices
colnames(cumscores) <- c("Time","UW","MSU") # Assigns corresponding names to score columns
plot(x = cumscores[,1],y = cumscores[,2],type = 'l', # Plots timepoints on x axis and UW 
                                                     # score on y axis as a line
     col = 'purple',xlab = 'Time', ylab = 'Score', # Assigns color to line and labels axes
     xlim = c(0,40),ylim = c(0,50)) # Sets upper and lower limits for axes
lines(x = cumscores[,1],y = cumscores[,3], # Plots MSU scores corresponding to timepoints
      col = 'green3') # Assigns color to MSU line
legend(1,50,c("UW","MSU"), # Positions legend and adds text
       lty = c(1,1,1),lwd = c(1,1,1),col = c("purple","green3")) # Adds and colors lines
