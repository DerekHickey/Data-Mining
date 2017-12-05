C8 <- read.csv("C8_PREP.csv")
library(caret)
library(rpart)
library(rpart.plot)
head(C8)
set.seed(0)
trainIndex <- createDataPartition(C8$PREP, p = 0.6, list = F)

train <- C8[trainIndex,]
test <- C8[-trainIndex,]

rplot <- rpart(PREP ~ + MS + SCHS + AGE65 + EMP + F1040 + MTR + DEPS + LOGTPI + INCOME, data = train, method = "class", control = rpart.control(cp = 0.01))

rpart.plot(rplot, type = 0, extra = 2, under = F, varlen = 0)

summary(rplot)

print(rplot)

test$pred <- predict(rplot, newdata = test, type ="class")
confusionMatrix(test$pred, reference = test$PREP)

log <- glm(PREP ~ + MS + SCHS + AGE65 + EMP + F1040 + MTR + DEPS + LOGTPI + INCOME, data = train, family=binomial(link="logit"))

summary(log)
print(log)
summary(pred)

pred <- predict(log, newdata = test, type = "response")

test$pred2 <- ifelse(pred>0.5,1,0)

 
cm <- addmargins(table(Predicted=test$pred2, Actual=test$PREP))

diag(cm)

