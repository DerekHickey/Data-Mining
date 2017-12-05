
setup_twitter_oauth(consumer_key="GZ0jDx1Kjivnbhf8y52Dh78SO",
consumer_secret="Y4KvA11kvZlsjUgKI3cGg5r6MReY3Pae2RvfNUQYs70p4giRAn",
access_token="725771773434712064-ipiFH6uRiqdxKhnlzp34ZuutwVcR3Ox",
  access_secret="MvmrCap78EB4b2Wpk0D3gg49nHfuTm0CkXtIzK8AqTohy")






tweetList <- searchTwitter("#targetboycott", n=600, lang=c("en", "eng"), since="2016-04-01")

tweetList$modtext <- str_replace_all(tweetDF$text,"  "," ")
