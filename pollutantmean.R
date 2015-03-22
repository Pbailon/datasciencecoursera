pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    fullcol <- c()
    for(i in id){
        i<-sprintf("%03d",i)
        filename <- paste(directory,"/", sep="")
        filename <- paste(filename,i, sep="")
        filename <- paste(filename,".csv",sep="")
        file <- read.csv(filename)
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        colfile <- file[,eval(pollutant)]
        colfile <- na.omit(colfile)
        fullcol <- c(fullcol, colfile)
    }
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    mean(fullcol)
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
}