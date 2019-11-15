#Exercise 8 Stephen Grisoli

#Plotting UW vs MSU cumulative score
#-----------------------------------------------------------------------------------------------#
#Importing .txt into a df and initializing varibles to be used later
df = read.table(file="UWvMSU_1-22-13.txt", header=TRUE)
#------------------------------------------------------------------#
#Indexes for adding elements to vectors b/c there is no push_back function
UW_index = 1
MSU_index = 1
#-----------------------------------------------------------------------------------------------#
#Empty vectors to be filled in loop
cum_score_UW = integer()
cum_score_MSU = integer()
UW_time_of_score = numeric()
MSU_time_of_score = numeric()
#-----------------------------------------------------------------------------------------------#
#for loop to iterate through dataframe and sort score and time into correct vector
for(i in 1:dim.data.frame(df)[1]){
  if(df[i,2]=="UW"){
    if(length(cum_score_UW)>0){
      cum_score_UW[UW_index] = cum_score_UW[UW_index-1] + df[i,3]
      UW_time_of_score[UW_index] = df[i,1]
      UW_index = UW_index+1
    } else{     #else case for when vector is empty an vec[index-1] would try to access vec[0]
        cum_score_UW[UW_index] = df[i,3]
        UW_time_of_score[UW_index] = df[i,1]
        UW_index = UW_index+1
    }
  }
  if(df[i,2]=="MSU"){
    if(length(cum_score_MSU)>0){
      cum_score_MSU[MSU_index] = cum_score_MSU[MSU_index-1] + df[i,3]
      MSU_time_of_score[MSU_index] = df[i,1]
      MSU_index = MSU_index+1
    } else{     #else case for when vector is empty an vec[index-1] would try to access vec[0]
      cum_score_MSU[MSU_index] = df[i,3]
      MSU_time_of_score[MSU_index] = df[i,1]
      MSU_index = MSU_index+1
      }
    
    }
 }
#-----------------------------------------------------------------------------------------------#
#ploting functions
plot(UW_time_of_score, cum_score_UW, type = "l", ylab="Score", xlab="Time (min)", main="MSU vs UW Score over time", col="#FF0000")
lines(MSU_time_of_score, cum_score_MSU, col="#0000FF")
 
 