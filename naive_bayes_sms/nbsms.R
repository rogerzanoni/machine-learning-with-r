# read the data

sms_raw <- read.csv("sms_spam.csv", stringsAsFactors=FALSE)

str(sms_raw)

# create the corpus

library(tm)

sms_corpus <- Corpus(VectorSource(sms_raw$text))

inspect(sms_corpus[1:3])

# clean the data

corpus_clean <- tm_map(sms_corpus, content_transformer(tolower))
corpus_clean <- tm_map(corpus_clean, removeNumbers)
corpus_clean <- tm_map(corpus_clean, removeWords, stopwords("english"))
corpus_clean <- tm_map(corpus_clean, removePunctuation)
corpus_clean <- tm_map(corpus_clean, stripWhitespace)

str(corpus_clean)
inspect(corpus_clean[1:3])

# create a sparse matrix using the corpus

sms_dtm <- DocumentTermMatrix(corpus_clean)

# prepare data for training

sms_raw_train <- sms_raw[1:4169,]
sms_raw_test <- sms_raw[4170:5559,]

sms_dtm_train <- sms_dtm[1:4169,]
sms_dtm_test <- sms_dtm[4170:5559,]

sms_corpus_train <- corpus_clean[1:4169,]
sms_corpus_test <- corpus_clean[4170:5559,]

# display wordclouds

wordcloud(sms_corpus_train, min.freq=40, random.order=FALSE)
