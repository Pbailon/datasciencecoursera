corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    files<-complete(directory)
    good <- files$nobs > threshold
    files<-files[good,]
    cors <- c()
    
    for(i in files$id){
        fulli<-sprintf("%03d",i)
        filename <- paste(directory,"/", sep="")
        filename <- paste(filename,fulli, sep="")
        filename <- paste(filename,".csv",sep="")
        file <- read.csv(filename)
        
        colfile <- file[complete.cases(file),]
        corfile <- cor(colfile$sulfate, colfile$nitrate)
        cors <- c(cors, corfile)
    }
    cors
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
}