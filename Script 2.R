
url <- paste("https://raw.githubusercontent.com/WinVector/", "zmPDSwR/master/Custdata/custdata.tsv", sep = "")
custdata <- read.table(url, header = T, sep = "\t")
head(custdata, n = 6)
summary(custdata)
count(custdata)
mean(custdata, na.rm = T)
is.na(custdata)
hist(age)
hist(custdata$age,breaks = 25,xlab = "age",col = "blue")
min(custdata$age)
plot(density(custdata$age),main = "distribution of age", xlab = "age")
     