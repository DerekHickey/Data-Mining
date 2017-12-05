wine <- read.table(file = "winequality-white.csv", header = T, sep = ";")
head(wine)
summary(wine)

wine$quality <- as.factor(wine$quality)

set.seed(0)

trainIndex2 <- createDataPartition(wine$quality, p = 0.6, list = F)

train2 <- wine[trainIndex2,]
test2 <- wine[-trainIndex2,]

summary(train2)
summary(test2)

library(nnet)

fitnn1 <- nnet(quality ~., 
               data=wine, 
               size=5,
               decay = .5,
               skip=TRUE, 
               linout=TRUE, maxit = 1000)
plotnet(fitnn1)


test2$pred <- predict(fitnn1, newdata = test2, type = "class")
confusionMatrix(test2$pred, reference = test2$quality)

library(randomForest)

randomforest <- randomForest( formula = quality ~., data = train2, importanance = T)

confusionMatrix(predict(randomforest, newdata = test2, type = "class"), reference = test2$quality)
