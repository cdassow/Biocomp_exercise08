#*** Use a for loop and if-else statemetn to calculate the sum of wages for males and females in wages.csv

# load wages data
wages=read.table("wages.csv",header=TRUE,sep=",",stringsAsFactors=FALSE)

# create variables to store sums
femaleSum=0
maleSum=0

for(i in 1:nrow(wages)){
  if(wages$gender[i]=="female"){
    femaleSum=femaleSum+wages$wage[i]
  }else{
    maleSum=maleSum+wages$wage[i]
  }
}

femaleSum
maleSum

sum(wages$wage[wages$gender=="female"])
sum(wages$gender=="male")

#*** Use a for loop to calculate the average sepal length for each species  
#    in the iris data set. Don't cheat and use the `mean()` function!
iris<-read.csv("iris.csv",header=TRUE,stringsAsFactors=FALSE)

speciesList<-unique(iris$Species)
obsCounts<-numeric(length(speciesList))
lengthSum<-numeric(length(speciesList))
for(i in 1:nrow(iris)){
  if(iris$Species[i]==speciesList[1]){
    obsCounts[1]<-obsCounts[1]+1
    lengthSum[1]<-lengthSum[1]+iris$Sepal.Length[i]
  }else if(iris$Species[i]==speciesList[2]){
    obsCounts[2]<-obsCounts[1]+1
    lengthSum[2]<-lengthSum[1]+iris$Sepal.Length[i]
  }else{
    obsCounts[3]<-obsCounts[1]+1
    lengthSum[3]<-lengthSum[1]+iris$Sepal.Length[i]
  }
}

sepalLengthmeans<-lengthSum/obsCounts
names(sepalLengthmeans)<-speciesList

#*** Use a for loop and if-else statement to find the minimum petal width 
#    of setosa iris in the iris data set. Don't cheat and use the `min()` 
#    function!
minPetalWidth<-1e6
for(i in 1:nrow(iris)){
  if(iris$Species[i]=="setosa"){
    if(iris$Petal.Width[i]<minPetalWidth){
      minPetalWidth<-iris$Petal.Width[i]
    }
  }
}

#*** Report starting element and length of runs in "findRuns.txt"
#load data from text file
findRuns=read.table("findRuns.txt",header=FALSE,sep="\t")
# convert data from a single-column dataframe to a vector
findRuns=unlist(findRuns)

# create a variable out that is currently undefined
out=NULL
# I will use this variable cur to hold onto the previous number in the vector;
# this is analagous to using findRuns[i-1]
cur=findRuns[1]
# this is a counter that I use to keep track of how long a run of repeated values is;
# if there are not repeated values than this count equals 1
count=1

# loop through each entry of our vector (except the 1st one, which we set to cur above)
for(i in 2:length(findRuns)){
  # test if the ith value in the vector findRuns equals the previous (stored in cur)
  if(findRuns[i]==cur){
    # test whether count is 1 (we aren't in the middle of a run) or >1 (in the middle of a run)
    if(count==1){
      # if the ith value in the vector equals the previous (stored in cur) and count is 1, we
      # are at the beginning of a run and we want to store this value (we temporarily store it in 'start')
      start=(i-1)
    }
    # we add one to count because the run continued based on the ith value of findRuns being equal to
    # the previous (stored in cur)
    count=count+1
    # if the ith value in findRuns is not the same as the previous (stored in cur) we either are not in a run
    # or we are ending a run
  }else{
    # if count is greater than 1 it means we were in a run and must be exiting one
    if(count>1){
      # add a row to 'out' that will hold the starting positions in the first column and the length
      # of runs in the second column; this appends rows to out after finding and counting each run
      out=rbind(out,c(start,count))
      # reset count to 1 because we just exited a run
      count=1
    }
  }
  # remember cur holds the previous element in findRuns, so we need to update this after each time
  # we go through the for loop
  cur=findRuns[i]
}

# give out column names and print it
colnames(out)=c('start','length')
print(out)
