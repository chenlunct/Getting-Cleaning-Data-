# read data
x1 <- read.table("test/X_test.txt")
y1 <- read.table("test/y_test.txt")
text1 <- read.table("test/subject_test.txt")

x2 <- read.table("train/X_train.txt")
y2 <- read.table("train/y_train.txt")
text2 <- read.table("train/subject_train.txt")

# merge test and train data set into one data set
x <- rbind(x1,x2)
y <- rbind(y1,y2)
text <- rbind(text1,text2)

# set column names
feature <- read.table("features.txt")
activity <- read.table("activity_labels.txt")
x <- as.data.frame(x)
colnames(x) <- feature$V2
colnames(activity) <- c("subject","activity")
colnames(y) <- "subject"

# subset the mean and standard
# merge the activity dataset
list <- grep("mean|std",feature$V2)
x <- x[,list]
x <- cbind(x,y)
x <- merge.data.frame(x,activity,by.x = "subject",by.y = "subject")

# output the table
write.table(x = x,file = "tidy.txt",row.name=FALSE)