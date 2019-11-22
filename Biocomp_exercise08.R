#Problem 1
uwmsu<-read.csv(file.choose()) #Choose UWvMSU.csv file
for(n in 1:nrow(uwmsu)){
  while(n==1){ #only for first n step(1) because n-1=0 causes error
    uwmsu[n,4]<-uwmsu[n,3] #first to score
    print(uwmsu[n,4])
    uwmsu[n,5]<-0 #did not score first
    print(uwmsu[n,5])
    n<-n+1 #Escape the while loop
  }
  if(uwmsu[n,2]=="UW"){
    uwmsu[n,4]<-(uwmsu[n,3])+(uwmsu[n-1,4]) #add new points to old score to get new score
    print(uwmsu[n,4])
    uwmsu[n,5]<-uwmsu[n-1,5] #keep non-scoring team points the same
    print(uwmsu[n,5])
  }else{
    uwmsu[n,4]<-uwmsu[n-1,4] #repeat but for other team
    print(uwmsu[n,4])
    uwmsu[n,5]<-(uwmsu[n,3])+(uwmsu[n-1,5])
    print(uwmsu[n,5])
  }
}
uwmsu
names(uwmsu)[names(uwmsu)=="V4"]<-"UWsum" #Name new columns made
names(uwmsu)[names(uwmsu)=="V5"]<-"MSUsum"
names(uwmsu)[names(uwmsu)=="ï..Time"]<-"Time"
plot(uwmsu$Time,uwmsu$UWsum, type='l',xlab='Time(min)',ylab='Score')
lines(uwmsu$Time,uwmsu$MSUsum)

#Problem 2
Play<- function()
{ 
  n <- readline(prompt="Enter an integer: ")
  if(!grepl("^[0-9]+$",n))
  {
    return(Play())
  }
  while(turns<maxturns){
    turns<-turns+1
    return(as.integer(n))
  }
}
#Run above line once, run lines below to begin game 
num <- sample(1:100, 1, replace=T)
guess <- -1
turns<-1
maxturns<-10

cat("I'm thinking of a number between 0 and 100..")

while(guess != num)
{ 
  guess <- Play()
  if (guess == num)
  {
    cat("Correct!")
  }
  else if (guess < num)
  {
    cat("Higher..")
  }
  else if(guess > num)
  {
    cat("Lower..")
  }
}
