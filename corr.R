# A function that takes a directory of data files and a threshold for complete cases 
# and calculates the correlation between sulfate and nitrate for monitor locations 
# where the number of completely observed cases (on all variables) is greater than the threshold

corr <- function (directory, threshold = 0){
  path <- paste("/Users/peddacama/Downloads/",directory,"/",sep="")
  filesList <- list.files(path=path,pattern=".csv")
  result <- numeric()
  for (i in 1:length(filesList)){
    df <- read.csv(paste("/Users/peddacama/Downloads/",directory,"/",sprintf("%03d",i),".csv",sep=""))
    if(sum(complete.cases(df)) > threshold){
      result <- c(result,cor(df$sulfate,df$nitrate))
    }
  }
  result
  
}



corr <- function(directory, threshold = 0){
  setwd(paste("/Users/peddacama/Downloads/", directory, sep = "/"))

  correlations <- numeric()
  files <- list.files(getwd(), full.names = TRUE)
  for (i in 1:332) {
    read_file <- read.csv(files[i])
    complete_observation <- read_file[complete.cases(read_file), ]
   number_complete <- nrow(complete_observation)
    if (number_complete >= threshold) {
      data <- read.csv(files[i])
      correlations <- c(correlations, cor(data$sulfate, data$nitrate, use="na.or.complete"))
    }
  }
  return(correlations)
}
