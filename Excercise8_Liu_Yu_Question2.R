# Question 2

# generate a random number from 1 to 100
key = sample(1:100,1)
print("I'm thinking of a number 1-100...")

# use a loop to let the user guess
count = 1
while(count < 10){
  count = count + 1
  guess = as.integer(readline(prompt="Guess: "))
  if(guess==key){
    print('Correct!')
    break
  } # when guess equal to the random number, jump out of the loop
  if(guess<key){
    print('Lower!')
  }else(
    print('Higher')
  )
}

