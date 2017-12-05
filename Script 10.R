read.table(lastfm.csv)
mydata = read.csv("lastfm.csv")
summary("last.fm")
factor("lastfm")

mydata$user <- as.factor(mydata$user)

f = (mydata$user)
x = (mydata$artist)
itemMatrix = split(x,f)

itemMatrix <- lapply(itemMatrix, unique)

itemMatrix <- as(itemMatrix, "transactions")
library(arules)

itemFrequency(itemMatrix)
sort(itemFrequency(itemMatrix), decreasing = FALSE, na.last = NA)

itemFrequencyPlot(itemMatrix, type = c("relative", "absolute"), support = .1, topN = NULL, horiz = FALSE, xlab = NULL, ylab = NULL)

quantile(itemFrequency(itemMatrix))

rule <- apriori(itemMatrix, parameter=list(support = .02186667, confidence = 0.4))

inspect(rule)
highLiftRules <- head(sort(rule, by="lift"), 7)
inspect(highLiftRules)
