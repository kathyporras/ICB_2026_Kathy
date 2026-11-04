#Class Notes Nov 4th

#BARPLOTS
areas <- c (11506, 5500, 16988, 2968, 3745, 9390, 6795)
names(areas)=c("Af", "ant", "as", "Au", "Eu", "NA", "Sa")
#here you will have the whole names in the graph
barplot(areas)
#here you can overwrite.
barplot(areas, names=c("Af", "ant", "as", "Au", "Eu", "Nooo", "Sa"))

barplot(areas, xlab="Land Mass")

barplot(areas, xlab="Land Mass (tons)", ylab="Area (Km2)", ylim=c(0, 16000), col="pink", border=NA)

barplot(areas, xlab="Land Mass (tons)", ylab="Area (Km2)", xlim=c(0, 16000), col="pink", border=NA, horiz=T)

data(iris)
head(iris)

#we can see a pattern only by looking at the colors and species.
barplot(iris$Sepal.Length, col=iris$Species, border=iris$Species)
#this things are very flexible.

#SCATTERPLOTS
plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=21, col="black", bg="purple", cex=1.78)

x <- seq(0, 16, 0.5)
plot(x, cos(x), pch=16, type="n")

#we didnt see a linear relationship but now coloring by species we can actually see a better pattern.
plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=21, col="black", bg=iris$Species, cex=1.78)

colors <- rep(NA, nrow(iris))
symbols<- rep(NA, nrow(iris))
colors[iris$Species == "setosa"] <- "gold"
colors[iris$Species == "versicolor"] <- "darkgreen"
colors[iris$Species == "virginica"] <- "orchid"


symbols[iris$Species == "setosa"] <- 21
symbols[iris$Species == "versicolor"] <- 22
symbols[iris$Species == "virginica"] <- 23


head(cbind(iris, colors))

plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=symbols, col="black", bg=colors, cex=1.2)

#defensive coding, you anticipate errors and you can edit your code to make easier to pick mistakes. Sometimes if R gets an error it just doesn't plot. But I didnt do it

plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=symbols, col="black", bg=colors, cex=1.2)

legend(x=7, y=4.3, c("I. set", "I. vir", "I.vir"), cex=0.75, pch=c(21, 22, 23), pt.bg=c("gold", "darkgreen", "orchid"))

#colors in R... we can use rgb function to make the proportion of each.
plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=symbols, col="black", bg=rgb(0,0.5,1), cex=1.2)

#digital color meter in mac
#or calculate colors in R like this
col2rgb("orchid")/255

#or google the hex code of the color you want and use it

#we can play around with alpha that is the opacity or transparencia
colors[iris$Species == "setosa"] <- rgb(1,0,0.85,0.5)
colors[iris$Species == "versicolor"] <- rgb(0.84, 0.39, 0.44, 0.5)
colors[iris$Species == "virginica"] <- rgb(0,0.43,0.84,0.5)

plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=symbols, col="black", bg=colors, cex=1.2)

#playing with alpha you can see that the density is where there is more color
plot(rnorm(1e4), rnorm(1e4), pch=16, col=rgb(0,0,0,0.2))

x <- seq(0, 16, 0.5)
plot(x/pi, cos(x), pch=16, type="b",
     xlab="x", ylab="cos(x)",
     cex.lab=1.5, cex.axis=0.75, cex.main=1.5,
     main="cosine of x")

text(10, 0.75, "y=cos(x)", cex=0.85)

#shapes and curves 

points(x/pi, sin(x), col="red", pch=16, type="b")

abline(h=0, lty=2)
abline(v=2, lty=2)

lines(x/pi, cos(x), col="red")

#adding the line of best fit after a linear regression
plot(iris$Sepal.Length, iris$Sepal.Width, xlab="Sepal Length (mm)", ylab="Sepal Width (mm)", pch=symbols, col="black", bg=rgb(0,0.5,1), cex=1.2)

reg <- lm(iris$Sepal.Width~iris$Sepal.Length)
abline(coef(reg), col="red")


x <- seq(0, 16, 0.5)
plot(x/pi, cos(x), pch=16, type="b",
     xlab="x", ylab="cos(x)",
     cex.lab=1.5, cex.axis=0.75, cex.main=1.5,
     main="cosine of x", ylim=c(0,1), xlim=c(0,10))

#histogram is the distribution of your variable. we can do one that can be added to the last one.
hist(iris$Petal.Width, breaks = seq(0,2.5, 0.1))

set <- iris$Petal.Width[iris$Species == "setosa"] 
vers <- iris$Petal.Width[iris$Species == "versicolor"] 
vir <- iris$Petal.Width[iris$Species == "virginica"] 

hist(set, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("gold")/255), alpha = 0.5), 
             xlim=c(0,2.5))

hist(vers, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("green")/255), alpha = 0.5), add=T,
     breaks=seq(0,2.5,0.1))

hist(vir, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("orchid")/255), alpha = 0.5), add=T, 
     breaks = seq(0,2.5,0.1))

#BOXPLOTS!!

boxplot(set, vers, vir,
        names = c("set", "vers", "vir"),
        xlab="Species", ylab="Petal Width (mm)", col=c("gold", "chartreuse", "orchid"))

boxplot(iris$Petal.Width~iris$Species,
        xlab="Species", ylab="Petal Width (mm)", col=c("gold", "chartreuse", "orchid"))

plot(iris$Species, iris$Petal.Width,
     xlab="Spaecies", ylab="Petal Width (mm)",
     col=c("gold", "chartreuse", "orchid"))

#multi-panel figures

par(mfrow=c(2,2))

hist(set, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("gold")/255), alpha = 0.5), 
     xlim=c(0,2.5))
#we can add text out of the margin
mtext("A.", side=3, adj=0.08, line=1, cex=1.2)

hist(vers, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("green")/255), alpha = 0.5),
     breaks=seq(0,2.5,0.1))
mtext("B.", side=3, adj=0.08, line=1, cex=1.2)

hist(vir, xlab="Petal Width(mm)",
     col=rgb(t(col2rgb("orchid")/255), alpha = 0.5), 
     breaks = seq(0,2.5,0.1))
mtext("C.", side=3, adj=0.08, line=1, cex=1.2)

boxplot(set, vers, vir,
        names = c("set", "vers", "vir"),
        xlab="Species", ylab="Petal Width (mm)", col=c("gold", "chartreuse", "orchid"))
mtext("D.", side=3, adj=0.08, line=1, cex=1.2)

#go to plots up and then save as pdf and then you can send it to inkscape that is free and you can edit everything there.



