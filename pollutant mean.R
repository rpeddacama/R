# A function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) 
# across a specified list of monitors

pollutantmean <- function(directory, pollutant, id = 1:332){
  
  filesList <- paste("/Users/peddacama/Downloads/",directory,"/",sprintf("%03d",id),".csv",sep="")
  mydata <- lapply(filesList,read.csv)
  polMean <- do.call("rbind",mydata)
  mean(polMean[[pollutant]],na.rm=TRUE)
  
}
