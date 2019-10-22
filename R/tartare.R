#R


#' downloads files from aws storage and returns local filepath
#'
#' calls the  \link[AnnotationHub]{query} method of an
#' \link[ExperimentHub]{ExperimentHub} 
#' objectquery and returns the local filenames.
#' Of note: for proprietary reasons, a \link[base]{file.link} is
#' set to the cached files. The overall file size is 285MB.
#' @param eh ExperimentHub object.
#' @param query a query string, e.g.,
#' \code{c('tartar', '20190710_003_PierceHeLaProteinDigestStd.raw')}
#' @importFrom AnnotationHub query
#' @return returns file contained in the tartare package
#' @export getFilename
#' @author Christian Panse <cp@fgcz.ethz.ch>
#' @aliases tartare
#'
#' @examples 
#' library(ExperimentHub)
#' eh <- ExperimentHub()
#' query(eh, c('tartare'))
#' 
#' \dontrun{
#' (files <- getFilename(eh))
#' library(MsBackendRawFileReader)
#' 
#' be <- lapply(files, function(f){
#' if (grepl("mzXML$", f))
#'     backendInitialize(MsBackendMzR(), files = f)
#' else
#'     backendInitialize(MsBackendRawFileReader(), files = f, extra=FALSE)
#' })
#' }
#' 
#' \dontrun{
#' 
#' hfx.filename <- .query(eh, c('tartar', '20190710_003_PierceHeLaProteinDigestStd.raw'))
#' x <- .cnew ("Rawfile", hfx.filename)
#' x$GetInfoValues()
#' }
#' @seealso \code{browseVignettes('tartare')}
#' 
getFilename <- function(eh, query=c("tartare")){
    res <- query(eh, query)
    vapply(res, function(x){
        sourcetype <- gsub("BLOB", "raw", x$sourcetype)
        f <- eh[[x$ah_id]]
        
        f.ext <- paste(f, sourcetype, sep='.')
        
        if (isFALSE(file.exists(f.ext))){
            file.link(f, f.ext)
        }
        as.character(f.ext)
        
    }, "203c576b7cbf_3236.raw")
}

