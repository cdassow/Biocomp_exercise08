#################################
# QUESTION 1
#################################

# Usage: just hit command + enter on every line

sports <- read.table(file.choose())
#select UWvMSU_1-22-13.txt

sconsin <- sports[sports$V2 == "UW" ,]
gogreen <- sports[sports$V2 == "MSU" ,]

badger_cum <- cumsum(as.numeric(sconsin$V3))
spartan_cum <- cumsum(as.numeric(gogreen$V3))
badger_time <- as.vector(sconsin$V1)
spartan_time <- as.vector(gogreen$V1)
  
plot(badger_time, badger_cum, type = "l", col = "red", xlab = "time", ylab = "score", main = "A Classic B1G Showdown")
lines(x = spartan_time, y = spartan_cum, col = "green")

#################################
# QUESTION 2
#################################

# before playing: command + enter on "game_fxn <- function" and "run_game <- function" to set up the game
# to play: run  run_game()


game_fxn <- function(){
  num <- readline(prompt = "Guess a whole number between 0-100...")
  if (!grepl("^[0-9]+$", num)){
    return(game_fxn())
  }
  return(as.integer(num))
}

run_game <- function(){
  
secret_num <- round(runif(1) * 100, digits = 0)
guess_num <- 0
tries <- 0

cat("I'm thinking of a number between 0-100...")

while (guess_num != secret_num){
  guess_num <- game_fxn()
  if (guess_num == secret_num){
    cat("You have correctly guessed the number. Nice.")
    break
  }
  else if (tries == 9){
    cat("You're out of tries. Bummer. ")
    cat("The number was ")
    print(secret_num)
    break
  }
  else if (guess_num < secret_num){
    tries = tries + 1
    cat("Higher. ")
    cat("You have")
    print(10 - tries)
    cat("tries remaining")
  }
  else if (guess_num > secret_num){
    tries = tries + 1
    cat("Lower. ")
    cat("You have")
    print(10 - tries)
    cat("tries remaining")
    }
  }
}
