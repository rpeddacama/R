# A function that reads a directory full of files and reports 
# the number of completely observed cases in each data file

complete <- function(directory,id = 1:332) {
  result <- NULL
  for (i in id){
    df <- read.csv(paste("/Users/peddacama/Downloads/",directory,"/",sprintf("%03d",i),".csv",sep=""))
    result <- rbind(result,data.frame(id=i,nobs=sum(complete.cases(df))))
  }
  result
}
