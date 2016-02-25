# Joe Ludmir, Poli Sci 4625, Professor Montgomery, P Set 3
# Due:  2/25/16

door <- structure(sample(1:3, size = 1), class = "door")
# Creates object door that must be a single number from 1 through 3 chosen at random
# and is of a new class called door.
winning_door <- sample(1:3, size = 1)
# Randomly picks the winning door
PlayGame <- function(door){
  UseMethod("Play Game", door)
}
# Creates generic method that has the name Play Game and takes in the argument door.
PlayGame_door <- function(door){
  if(door == winning_door){
    print("Great job, you win a new car!")
  } else  {
    print("Oh schucks, nice try, but you just get a hot wheels toy.")
  }
}
# In the PlayGame_door function, the function takes in a door object,
# and if the selected door is equal to the randomly chosen winning door,
# you win a car, else you do not and you win a toy.
