#Part 1
#Load game data
data<-read.table("~/Biocomp/Biocomp_exercise08/UWvMSU_1-22-13.txt", header=TRUE)
head(score)
sumFemale<-0
sumMale<-0
for(i in 1:nrow(wages)){
  if(wages[i,]$gender=="female"){
    sumFemale<-sumFemale+wages[i,]$wage  
  }else{
    sumMale<-sumMale+wages[i,]$wage
  } 
}
sumFemale
sumMale

for(i in 1:nrow(data)){
  if(data[i,]$team=="UW"){
    UWsum=UWsum+data[i,]$score
    UWscore[i,]=UWsum
  }
}
UWscore
 # }else{
  #  MSUsum=MSUsum+score[i,]$V3
   # MSUscore[i,]=MSUsum
  #}
#}

UW<-score[score$V2=="UW",]
UW
for(i in 1:nrow(UW)){
  UWsum<-UWsum+UW[i,]$V3
  UWscore[i,]<-UWsum
}
UWscore
UWscore<-matrix(nrow=50, ncol=2)
UWscore[,1]<-(1:50)
UWscore
MSUscore<-matrix(nrow=50, ncol=2)
UWscore[1,2]<-3
head(UWscore)
UWsum<-0
MSUsum<-0

#Part 2
#Generate a random number stored as a
a<-sample(1:100,1)
#The function NumberGuess that runs 10 times
NumberGuess<-function(){
  for(i in 1:10){
    guess<-readline(prompt="Guess: ")
    if(a<guess){
      print("lower")
    }else{
      if(a>guess){
        print("higher")
      }else{
        if(a==guess){
          print("correct")
        }
      }
    }
  }
}
#Run the function
NumberGuess()
