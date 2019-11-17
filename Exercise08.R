#Problem 2
game = function(){
  print("I'm thinking of a number 1-100...")
  count = 1
  integer = sample(1:100,1,replace=TRUE)
  n = as.integer(readline(prompt="Guess:"))
  while(n!=integer&&count<10){
    if(n>integer){
      print("Lower")
      n = readline(prompt="Guess:")
      count = count+1
    }else if(n<integer){
      print("Higher")
      n = readline(prompt="Guess:")
      count = count+1
    }
  }
  if(n==integer){
    print("Correct!")
  }
}

