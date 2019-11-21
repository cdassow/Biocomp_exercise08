# Question 1

# set path to the folder in local
setwd('/Volumes/GoogleDrive/My\ Drive/ND2019Fall/Intro\ Biocomputing/Excercise\ 8/Biocomp_exercise08')

# import the score-by-score form
score = read.table('UWvMSU_1-22-13.txt',header = T)

# run the loops to calculate the cumulative score of each team in each time point
nr = nrow(score)
time = score$time

uw.score = c() # create empty vector to store the cumulative scores
msu.score = c()
for (i in c(1:nr)){
  score.tmp = score[1:i,] # disset temporary scores
  uw.score.tmp = sum(score.tmp[which(score.tmp$team=="UW"),"score"]) # calculate cumulative scores
  uw.score = c(uw.score,uw.score.tmp)
  msu.score.tmp = sum(score.tmp[which(score.tmp$team=="MSU"),"score"]) 
  msu.score = c(msu.score,msu.score.tmp)
}

# plot the scores of two teams
plot(time,uw.score,type='l',col = 'red', 
     xlab = 'Time (min)', ylab = 'Score', main = 'UW vs MSU')
lines(time,msu.score, col = 'blue')
# add legends
legend("topleft", legend = c('UW Score', 'MSU Score'),
       col = c('red', 'blue'), lty = 1, cex = 0.8)


