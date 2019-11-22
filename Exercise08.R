#prepare environment, load data
rm(list = ls())
TheBigGame <- read.table("~/Desktop/biocomputing/Biocomp_exercise08/UWvMSU_1-22-13.txt", sep = "\t", header = TRUE, stringsAsFactors = FALSE)

#create 2 new dataframes with the score for each team at each time
UW_scores <- TheBigGame[TheBigGame$team=="UW", c(1,3)]
MSU_scores <- TheBigGame[TheBigGame$team=="MSU", c(1,3)]
#this will add a new column to each of those dataframes
UW_scores$cscore <- ave(UW_scores$score, FUN = cumsum)
MSU_scores$cscore <- ave(MSU_scores$score, FUN = cumsum)
#plotting the relevant data
plot(x = UW_scores$time, y = UW_scores$cscore, type = "l", xlab = "time", ylab = "score", col = "red")
lines(x = MSU_scores$time, y = MSU_scores$cscore, col = "green")

#the game
answer <- sample(1:100)[1]
while (input != answer){
    input <- as.numeric(readline(prompt = "What is your guess?")) 
  if (input > answer) {
    print("Lower")
  } else if (input < answer) {
    print("Higher")
  } else {
    print("Yay!")
    break
  }
}
