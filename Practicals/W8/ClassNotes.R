#some functions
print("hello world")
sqrt(2)

#looking for help
?print
??"glm"
??"^glm"

#there are functions and operations 
sqrt(5) #function and argument which is 5
(5+5)*5
5+5*5

5%%3

#these two are the same 
5^3
5**3

#logical operations
4>5
4<5
5 != 5 #not eaual to the exclamation points
5 <= 5

#variables

a <- 4 #not equals but arrows
4+45-6/7 -> c#the arrow works in both directions

c + 4
c*c

#there are kind of numerical data types
x<-5.2
class(x) #continous number line
y<-as.integer(x)
class(y)
is.integer(x) #números enteros 

#R is a statistical and mathematical language, so R recognizes complex numbers.
d <- 2 + 4i
class(d)

#there are functions for everything in R
abs(-4)
floor(4.1) #rounding down 
ceiling(4.1) #rounding up

log10(3)
exp(2)
#there are variables already created for you
pi
tanh(pi)

seq <- "AAA TTT GGG" #spaces count as regular spaces. R is not too good at text.
class(seq)
strsplit(seq, split=" ")
#r starts counting on 1 not like python
substr(seq, start=1, stop=3)

gsub("T", "U", seq)

toupper("lalala")
tolower(seq)
paste("The sequence is ", seq, sep="---")
seq2<- gsub(" ", "", seq)
seq2

#this is cool about R that you can run multiple functions in one argument
paste("The length of the sequence is", nchar(seq2))

closed <- TRUE
open <- FALSE
class(open)

open + closed

#this is the conditional so it's going to be false
a <- 5==2
a
5<=7
is.numeric(4) | 4 %% 3 == 0 #el palo es or
is.numeric(4) & 4 %% 3 == 0 #this is and the other one not just or so it's false because one is not true

v <- c(2,3,4,5)
class(v)
x<-c("one", "two", "three")
class(x)

a<-c(1,TRUE, 7, FALSE)
a

5:43
seq(0, 100, 2)

v[3:5]
v<-seq(0,20,2)
v[c(1,3)]
v[3]<-55
v
v[c(-4,-5)] #removes the numbers in that position 

v[c(2,4, 5)] <- c(55, 0, 12)
v

rep(c("hello", "how", "are", "you"), c(1,2,1,4))

x
v+3
median(v)
sd(v)
quantile(v, 0.9)
v
sort(v)
summary(v)
v

#also works with ocurrences
vis<-c("bear", "racoon","racoon", "racoon", "cat", "cat")
class(vis)
vis<-as.factor(vis)
class(vis)
summary(vis)
plot(vis)

#Exercises
z<-seq(2, 100, 2)
z
sum(z)
sum(z) == 51*50
z^2 #all of them elevados a la 2
z >= 90 #answers for all of them
which(z >= 90) #told us which numbers in the vector are higher or equal to 90

#matrices
mat<- matrix(c(1,2,3,4,5,6), nc=2, nr=3)
mat
dimnames(mat) <- list(c("r1", "r2", "r3"), c("c1", "c2"))
mat
mat <- matrix(c(1,2,3,4,5,6), nc=2, nr=3, byrow=T)
mat
matrix(c("one","two", "three", "five"), nc=2, nr=2)
matrix(c(1,2), nc=2, nr=4, byrow=T)
mat
nrow(mat)
ncol(mat)
dim(mat)

mat[3, 2]#rows first and column then

mat[1,]
mat[,2]
mat[,c(1,2)]

M<-matrix(2:5, nc=2, nr= 2)
M
solve(M)
round(M %*% solve(M))

M
diag(M)

t(mat)

#data frame are big tables and each columns are vectors 
ID <- c("P1", "P2", "P3", "P4")
Treatment <- as.factor(c("Fert", "Cont", "Fert", "Cont"))
Weight <- c(22,24,34,32)
df <- data.frame(ID, Treatment, Weight)
df
str(df)#a good way to know what's going on with your data frame
head(df, n=2)
tail(df, 2)
df[1,3]
df$Treatment[1:3]

#you can extract this from your database in case you only wanna see a part of it for example
df[df$Treatment=="Cont",]

df2 <- data.frame(height = c(4,3,5,3), LArea=c(4,8,2,5))
df2
df_all<-cbind(df, df2)
df_all
df_all$Experimenter <- c("John", "John","Sarah", "Sarah")
df_all

#generally you dont create your dataframes like this you work with big datasets and you have to know how to open them

data(trees)
trees
nrow(trees)
ncol(trees)

class(trees)
class(trees$Girth)
class(trees$Height)
class(trees$Volume)

tall<-trees[trees$Height > 75,2]
tall
mean(tall)
length(tall)

#Lists in R
my_list <- list(vec=v, mat=M, dataframe=df)
str(my_list)

my_list[[2]]
my_list[[2]][,2]
my_list$mat[,2]

#how to read documents
geno<-read.table("/Users/kathy/Documents/VT/IntroCompBio/IntroBiolComp-2026/R/DataFiles/H938_Euro_chr6.geno", sep=" ", header = T)
str(geno)
head(geno)

geno$A1 <- as.factor(geno$A1)

#how to write a file
geno_top <- head(geno, n=5)
write.table(geno_top, file="geno_small.tsv", sep="\t", row.names=F, col.names=F, append=T)
