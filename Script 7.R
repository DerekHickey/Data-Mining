dat <- read.table("spam.csv", sep=",",header=T)
head(dat)

library(caret)

set.seed(2)
trainIndex<-createDataPartition(dat$spam,
                                p=0.60,
                                list=F)
train<-dat[trainIndex,]
test<-dat[-trainIndex,]

spam_logistic1 <- glm (spam ~ .- word_freq_all - word_freq_mail - word_freq_report - word_freq_telnet - word_freq_1999 - word_freq_font - word_freq_receive - word_freq_email - char_freq_paren - char_freq_bracket - word_freq_857 - word_freq_cs - word_freq_415 - word_freq_people - word_freq_table - word_freq_labs - word_freq_direct - word_freq_original - word_freq_will - word_freq_order - word_freq_lab - word_freq_3d - word_freq_make - word_freq_address,
                        data=train,
                        family=binomial(link="logit"))
summary(spam_logistic1)

1 - (spam_logistic1$deviance/spam_logistic1$null.deviance)


probs <- predict(spam_logistic1, type = "response")
train$probs<-probs
train$pred <- ifelse(train$probs>0.5,1,0)
addmargins(table(Actual=train$spam, Predicted=train$pred))


cm <- prop.table(table(Actual=train$spam, Predicted=train$pred)) 
diag(cm)
accuracy <- sum(diag(cm))
print(accuracy)

probs <- predict(spam_logistic1, newdata=test, type = "response")
test$probs<-probs
test$pred <- ifelse(test$probs>0.5,1,0)
addmargins(table(Actual=test$spam, Predicted=test$pred))


cm2 <- prop.table(table(Actual=test$spam, Predicted=test$pred)) 
diag(cm2)
accuracy2 <- sum(diag(cm2))
print(accuracy2)

library(ROCR)
