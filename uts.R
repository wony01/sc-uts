#import data
library(readr)
sonar <- read_csv("C:/Users/fahmi/Downloads/sonar.all-data", colnames=FALSE)
#library yang digunakan
library(RWeka)
library(caTools)
library(caret)
#bagi data
sampel <- sample.split(sonar$X61, SplitRatio = 0.7)
train <- subset(sonar, sampel==TRUE)
test <- subset(sonar, sampel==FALSE)
#buat model
Model = J48(X61~., train)
Model
plot(Model)
#pred
prediksi <- predict(Model, test)
#akurasi model
hasil = ConfusionMatrix(table(prediksi, test$X61))
hasil