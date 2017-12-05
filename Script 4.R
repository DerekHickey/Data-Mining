download.file("http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv", destfile="advertising.csv", method = "curl")
read.table("Advertising.csv")
mydata = read.csv("Advertising.csv")
summary(mydata)
mydata$X = NULL

cor(mydata)
cor(mydata$Sales, mydata$TV)

library(car)
scatterplotyMatrix(mydata)

model1 <- lm(Sales~Radio+Newspaper+TV, data = mydata)

model1$residuals

mean(model1$residuals)

plot(density(model1$residuals), ylim = c(0,.3),
main="Distribution of Residuals",
xlab = "Residuals")
lines(density(rnorm(1000000,0,sd=sd(model1$residuals))), col="red")

new <- data.frame(TV=150, Newspaper=23, Radio=26) 

predict(model1, newdata=new, interval = "prediction")

library(scatterplot3d)

lm2<-lm(Sales~Radio+Newspaper+TV,data=mydata) 

s3d <- scatterplot3d(x=mydata$Radio, y=mydata$TV, z=mydata$Newspaper) 
