#class notes october 21st

mat <- matrix(c(1,2,3,4,
                5,6,7,8,
                9,0,1,2), nr=3, nc=4)

matr <- t(mat)

#Do analyses - making notes in code is good

#use indentations
for (x in c(10,20,30)){
  print(x)
  if (x>10) {print("Above ten")
    if (x>20) {print("and also above 20!!")
    } else {
      print("but not above 20.")
    } 
  }else {
    print("Equal or below 10.")
    }
}


#loops if to do something repetitive. R 
#conditionals
x <- 7
if(x>4){
  print("X is bigger than 4")
}

#is this an even number 
if(x %% 2 == 0){ 
  print("x is even")
}

#aqui si tira algo porque x is even
x <- 8
if(x %% 2 == 0){ 
  print("x is even")
}

#we can write an else and then make the code to do something else.

z <- readline(prompt = "Enter a number: ")
z <- as.numeric(z)

if(z %% 2 == 0){
  print(paste(z, "is even"))
} else {
  print(paste(z, "is odd"))
}

#fizz and buzz
x <- readline(prompt = "Enter a number: ")
x <- as.numeric(x)

#exercise
if(x %% 3 == 0){
  print(paste(x, "fizz"))
} else if(x %% 5 == 0) {
  print(paste(z, "buzz"))
}

#loops

v <- 1:12
for(i in v){
  print(i^3)
}

for(i in 1:length(v)){
  print(i^3)
}

v <- c(2,4,5,6,8,10,12)
v_5 <- c()

for(i in 1:length(v)){
  v_5[i] <- v[i]^5
}
v_5
data.frame(v, v_5)

#other conditions

x <- 137

res <- c()
found <- 0

while(found < 4){
  if(x %% 137 == 0){ #we start in 137 because x is 137 you want to plan where you want to run through
    res <- c(res, x)
    found <- found + 1
  }
  x <- x+1
}

found
res

#repeat
#you will have to tell it to stop because this will go to the infinite
times <- 0
repeat{
  print("hello!")
  times <- times + 1
  if(times>=5){
    break
  }
}

#this is wrong
times2 <- 137
m <- 0
repeat{
  if(m < 4)
    break
  times2 <- times2 + 1
  if(times2 %% 137 == 0){
  }
}

#todo lo de all fortune me lo perdí

#insalling packages
#there are packages that we can install from github
install.packages("BiocManager")
library(BiocManager)
install("edgeR")

