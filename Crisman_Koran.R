#question1
stats=read.table(file="UWvMSU_1-22-13.txt",header=TRUE)

UW_scores=stats[stats$team =="UW",]
MSU_scores=stats[stats$team =="MSU",]

UW_total_score<-c()
MSU_total_score<-c()

UW_total_score[1]<-UW_scores$score[1]
MSU_total_score[1]<-MSU_scores$score[1]

for(i in 2:nrow(UW_scores)){
  UW_total_score[i]<-UW_scores$score[i] + UW_total_score[i-1]}

for(i in 2:nrow(MSU_scores)){
  MSU_total_score[i]<-MSU_scores$score[i] + MSU_total_score[i-1]}

plot(UW_scores$time, UW_total_score, type = "l", xlab = "Time", ylab = "Score", col="orange")
lines(MSU_scores$time, MSU_total_score, type = "l", col="blue")

#question2
random_number<-sample(1:100, 1)
print("I'm thinking of a number 1-100")
number_tries<-0
user_input<-0

while(user_input != random_number && number_tries <= 10){
  user_input<-readline(prompt = "Guess? ")
  if(user_input>random_number){
    print("Lower")
  }
  else if(user_input<random_number){
    print("Higher")
  }
  else{
    print("Correct!")
  }
  number_tries=number_tries+1
}
