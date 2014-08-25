testData <- read.table("test/X_test.txt")
trainData <- read.table("./train/X_train.txt")
testLabels <- read.table("./test/y_test.txt")
trainLabels <- read.table("./train/y_train.txt")
subjectTest <- read.table("./test/subject_test.txt")
subjectTrain <- read.table("./train/subject_train.txt")
mergedData <- rbind(trainData, testData)
mergedSubject <- rbind(subjectTrain,subjectTest)
mergedLabels <- rbind(trainLabels, testLabels)[[1]]
featuresNames <- read.table("features.txt")
featuresNames <- featuresNames[[2]]
names(mergedData) <- featuresNames
testData <- NULL
trainData <- NULL
testLabels <- NULL
trainLabels <- NULL
mergedData <- mergedData[,grep("mean\\(\\)|std\\(\\)",names(mergedData))]
activityNames <- read.table("activity_labels.txt")
activityNames <- factor(activityNames[[2]])
mergedLabels <- activityNames[mergedLabels]
mergedData["activity_labels"] <- mergedLabels
mergedData["Subject"] <- mergedSubject
write.table(mergedData, "./merged_dataset.txt", row.names = FALSE)
tidy  <- aggregate(mergedData,by=list(mergedData$Subject,mergedData$activity_labels), FUN=mean)



