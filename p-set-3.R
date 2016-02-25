# Joe Ludmir, Poli Sci 4625, Professor Montgomery, P Set 3
# Due:  2/25/16

# S3

door <- structure(sample(1:3, size = 1), class = "door")

# Creates object door that must be a single number from 1 through 3 chosen at random
# and is of a new class called door.

PlayGame <- function(door) {
  UseMethod("Play Game", door)
}

# Creates generic method that has the name Play Game and takes in the argument door.

PlayGame_door <- function(door) {
  winning_door <- sample(1:3, size = 1)
  if(door == winning_door) {
      print("Great job, you win a new car!")
  }  else  {
      print("Oh schucks, nice try, but you just get a hot wheels toy.")
  }
}

# In the PlayGame_door function, the function takes in a door object,
# and if the selected door is equal to the randomly chosen winning door,
# you win a car, else you do not and you win a toy.

# Run example

PlayGame_door(2)

# S4

setClass(Class = "door", representation(door_num = "numeric"))

# Creates a class door with an object door_num that is an integer

setValidity("door", function(object) {
  choice <- object@door_num
  test1  <- all(choice == 1)
  test2  <- all(choice == 2)
  test3  <- all(choice == 3)
  if(!test1 & !test2 & !test3){return("@door_num is not a valid door choice")}
}
)

# This ensures that the only door_nums that can be chosen are one through three,
# otherwise it returns an error message.

setGeneric("PlayGame", function(object) {
  standardGeneric("PlayGame")
}
)

# Creates a generic method PlayGame

setMethod("PlayGame", signature(object = "door"), function(object) {
  victory_door <- sample(1:3, 1)
  if(object@door_num == victory_door){
      print("Great job, you win a new car!")
  } else {
      print("Oh schucks, nice try, but you just get a hot wheels toy.")
  }
}
)

# This method takes the class, the generic, and then randomly selects a winning door, 
# and if the door_num matches it you win, otherwise you lose.  

# Run example

doorwow <- new("door", door_num = 2)
PlayGame(doorwow)