
if (!file.info("UCI HAR Dataset")$isdir) {
  dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  dir.create("Proyecto")
  download.file(dataFile, "./data/UCI-HAR-dataset.zip", method="libcurl")
  unzip("./data/UCI-HAR-dataset.zip")
}


#1
features<-read.table("./data/features.txt")
x_test<-read.table("./data/X_test.txt",col.names=features[,2])
x_train<-read.table("./data/X_train.txt",col.names=features[,2])
x<-rbind(train,test)

#2

measurements <- features[grep("(mean|std)\\(", features[,2]),]
#x<-features[grep("mean|std",features$V2),]
mean_and_std <- Datos[,measurements[,1]]

#3
y_test <- read.table("./data/y_test.txt", col.names = c('activity'))
y_train <- read.table("./data/y_train.txt", col.names = c('activity'))
y <- rbind(y_test, y_train)

labels <- read.table("./data/activity_labels.txt")
for (i in 1:nrow(labels)) {
  code <- as.numeric(labels[i, 1])
  name <- as.character(labels[i, 2])
  y[y$activity == code, ] <- name
}

#4
X_with_labels <- cbind(y, x)
mean_and_std_with_labels <- cbind(y, mean_and_std)

#5
subject_test <- read.table("./data/subject_test.txt", col.names = c('subject'))
subject_train <- read.table("./data/subject_train.txt", col.names = c('subject'))
subject <- rbind(subject_test, subject_train)
averages <- aggregate(x, by = list(activity = y[,1], subject = subject[,1]), mean)

write.csv(averages, file='./data/result.txt', row.names=FALSE)

