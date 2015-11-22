run_analysis <- function(){
  x_train <- read.table("X_train.txt",sep = "")
  y_train <- read.table("y_train.txt",sep = "")
  sub_train <- read.table("subject_train.txt",sep = "")
  x_test <- read.table("X_test.txt",sep = "")
  y_test <- read.table("y_test.txt",sep = "")
  sub_test <- read.table("subject_test.txt",sep = "")
  fea_name <- read.table("features.txt",sep = "")
  
  x_train <- cbind(x_train, y_train)
  x_train <- cbind(x_train, sub_train)
  
  x_test <- cbind(x_test, y_test)
  x_test <- cbind(x_test, sub_test)
  
  mergedata <- rbind(x_train, x_test)
  colnames(mergedata) <- fea_name$V2
  names(mergedata)[562] <- "activity"
  names(mergedata)[563] <- "subject"
  
  mean_std <- mergedata[,c(1,2,3,4,5,6,562,563)]
  colnames(mean_std) <- c("AccmeanX","AccmeanY","AccmeanZ","AccstdX","AccstdY","AccstdZ","activity","subject")
  
  tidydata <- aggregate(AccmeanX+AccmeanY+AccmeanZ+AccstdX+AccstdY+AccstdZ ~ activity + subject, data = mean_std, mean)
  write.table(tidydata, "C:/Users/T/Desktop/tidy_data.txt", sep="\t", row.name=FALSE)

}
