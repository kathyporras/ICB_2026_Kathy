#Class notes October 28
#the prob is the same in both
experiment <- sample(c("R", "L"), size=16, p=c(0.5,0.5), rep=T)
experiment 

experiment == "R"
#the su of all 1's
sum(experiment == "R")

right <- sum(experiment == "R")
right

right_ct <- c()
nExp <- 100

for(i in 1:nExp){
  experiment <- sample(c("R", "L"), size=16, p=c(0.5,0.5), rep=T)
  right <- sum(experiment == "R")
  right_ct[i] <- right
}
 
right_ct 

#we didn't have 13
table(right_ct)  

#because probably the number 13 has less probility than 1 in 100. You want to run 100 times if you want to find that. That's how we design experiments. The more simulations, the better.However there has to be a point because you have to end. If we change 100 for 10000 then we will get more numbers.
table(right_ct)/nExp


right_ct <- c()
nExp <- 1000000

for(i in 1:nExp){
  experiment <- sample(c("R", "L"), size=16, p=c(0.5,0.5), rep=T)
  right <- sum(experiment == "R")
  right_ct[i] <- right
}

right_ct 

#we didn't have 13
probs <- table(right_ct)/nExp 
probs
barplot(probs)
probs[14:17]
#we want to add all the results possible. 

p_val <- sum(c(probs[14:17], probs[0:4])) 
#this is a randomized process so this will be different everytime.
p_val


#exercise
for(i in 1:nExp){
  experiment <- sample(c("R", "L"), size=16, p=c(0.5,0.5), rep=T)
  right <- sum(experiment == "R")
  right_ct[i] <- right
}


p_val <- sum(c(probs[15:17], probs[1:3])) 
p_val

p_val <- sum(c(probs[15:17], probs[12:14])) 
p_val

#so you are interested in the tails to see what is the prob of having that if our hypothesis is true
p_val <- sum(c(probs[14:17], probs[1:5]+(2/nExp))) 
p_val

for(i in 1:nExp){
  experiment <- sample(c("R", "L"), size=18, p=c(0.5,0.5), rep=T)
  right <- sum(experiment == "R")
  right_ct[i] <- right
}

probs

p_val <- sum(c(probs[17:19], probs[])) 
p_val

geo_dist <- read.csv("Leuk_geoDist.csv", row.names = 1)
dim(geo_dist)

temp_dist <- read.csv("Leuk_tempDist.csv", row.names = 1)
dim(temp_dist)

geo_dist <- as.dist(geo_dist)
temp_dist <- as.dist(temp_dist)

plot(geo_dist, temp_dist, xlab="Geographic Distance (miles)", ylab="Temporal Distance (days)")

cor(geo_dist, temp_dist, method="spearman")

#here is low butit's bad calculated because is assuming our data is totally independent and it's not.
cor.test(geo_dist, temp_dist, method="spearman")

v <- 1:3
v[c(2,1,3)]

v <- c("a", "b", "c")
v[c(2,1,3)]

order <- sample(1:length(temp_dist), size=length(temp_dist), replace = F)

temp_shuf <- temp_dist[order]

#we broke correlations because we shuffle the data
plot(geo_dist, temp_shuf, xlab="Geographic Distance (km)", ylab="Temporal Distance (days)")

nPer <- 1000
cor_coef <- c()

for (i in 1:nPer){
  order <- sample(1:length(temp_dist), size=length(temp_dist), replace = F)
  temp_shuf <- temp_dist[order]
  cor_coef[i] <- cor(geo_dist, temp_shuf, method="spearman")
}

summary(cor_coef)

hist(cor_coef)

sum(abs(cor_coef) >= 0.38)


#exercise
#1
mating <- read.table("Pseudoscorpion_mating.tsv", header = T, sep = "\t")
head(mating)
View(mating)

d <- mean(mating$Successful_broods[which(mating$Treatment == "Double")])
s <- mean(mating$Successful_broods[which(mating$Treatment == "Single")])

diff_means <- d-s
diff_means

#2

order <- sample(1:length(mating$Successful_broods), rep=F)
rand_brood <- mating$Successful_broods[order]

mating$order <- order

d1 <- mean(rand_brood[which(mating$Treatment == "Double")])
s1 <-mean(rand_brood[which(mating$Treatment == "Single")])

newdiff <- d1-s1
newdiff

#3
nPer <- 10000
diffs<- c()

#this is wrong
for (i in 1:nPer){
  order <- sample(1:length(mating$Successful_broods), rep=F)
  rand_brood <- mating$Successful_broods[order]
  mean_diff[i] <- (mean(mating$order[which(mating$Treatment == "Double")]) - mean(mating$order[which(mating$Treatment == "Single")]))
}
summary(mean_diff)


n_ext <- sum(abs(diffs) >= abs(mean_diff))

#speeding up your code

vec <- runif(1e7)
vec_new <- c()

for(i in 1:length(vec)){
  vec_new[i] <- vec[i]/4  
}

vec.new <- vec/4
#you can do this to make sure your function lasts little or high ammount of time.

system.time(vec/4)
