#R

.onAttach <- function(lib, pkg) {
    if (interactive()) {
        version <- packageVersion('tartare')
        packageStartupMessage("Package 'tartare' version ", version)
        
        invisible()
    }
}

#' getExperimentHubFilename 
#' 
#'
#' @param filename of the aws s3 blob.
#' @return the file name of the local ExperimentHub.
#' @aliases tartare
#' @export getExperimentHubFilename
#' @importFrom AnnotationHub query
#' @importFrom ExperimentHub ExperimentHub
#' 
#' @examples 
#' fl <- system.file("extdata", "metadata.csv", package="tartare")   
#' metadata <- read.csv(fl, stringsAsFactors=FALSE)
#'      metadata$Title     
#'      
#' lapply(metadata$RDataPath, getExperimentHubFilename)
getExperimentHubFilename <- function(filename){
   suppressMessages({
        eh = ExperimentHub()
    
        # filename <- query(eh, c("tartare", filename))[[1]]
        filename <- NULL
       })
    filename
}
