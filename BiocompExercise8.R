#Part 1
#Load game data
score<-read.table("~/Biocomp/Biocomp_exercise08/UWvMSU_1-22-13.txt")
nrow(score)
#Create data frame subset of just UW data
UW_data<-as.data.frame(score[score$V2=="UW",])

#Create data frame subset of just MSU data
MSU_data<-as.data.frame(score[score$V2=="MSU",])

UWscore<-matrix(nrow=50, ncol=2)
MSUscore<-matrix(nrow=50, ncol=2)
UWtotal<-0
MSUtotal<-0
for(i in 2:nrow(score)){
  if(score[score$V2="UW"]){
    UWsum<-sum(UWtotal+score[[i],score$V3])
    UWscore[[i],]<-UWsum
    MSUsum<-MSUtotal
    MSUscore[i,]<-MSUsum
  }else{
    UWsum<-UWtotal
    MSUsum<-sum(MSUtotal+score[i,score$V3])
    MSUscore[i,]<-MSUsum
  }
}



#Part 2
#Generate a random number a

a<-sample(1:100,1)

#Function


answer<-readline(prompt="Guess ")
if(a>answer){
   print("lower")
}else{
  if(a<answer){
    print("higher")
  }else{
    if(a==answer){
      print("correct")
     }
  }
}

a
