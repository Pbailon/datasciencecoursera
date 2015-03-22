complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    ids <- c()
    nobss <- c()
    for(i in id){
        fulli<-sprintf("%03d",i)
        filename <- paste(directory,"/", sep="")
        filename <- paste(filename,fulli, sep="")
        filename <- paste(filename,".csv",sep="")
        file <- read.csv(filename)
        
        colfile <- file[complete.cases(file),]
        ids <- c(ids, i)
        nobss <- c(nobss, nrow(colfile))
    }
    df <- data.frame(id = ids, nobs = nobss)
    df
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
}