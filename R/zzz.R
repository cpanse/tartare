#R

#' @importFrom utils packageVersion
.onAttach <- function(lib, pkg) {
    if (interactive()) {
        version <- packageVersion('tartare')
        packageStartupMessage("Package 'tartare' version ", version)
        
        invisible()
    }
}



#' get packages files
#'
#' calls the  \link[AnnotationHub]{query} method of an
#' \link[ExperimentHub]{ExperimentHub} 
#' objectquery and returns the local filenames.
#' Of note: for proprietary reasons, a symbolic link is set to the cached files.
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
#' (files <- getFilename(eh))
#' 
#' \dontrun{
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
getFilename <- function(eh, query=c("tartare")){
    res <- query(eh, query)
    vapply(res, function(x){
        sourcetype <- gsub("BLOB", "raw", x$sourcetype)
        f <- eh[[x$ah_id]]
        
        f.ext <- paste(f, sourcetype, sep='.')
        
        if (isFALSE(file.exists(f.ext))){
            file.symlink(f, f.ext)
        }
        as.character(f.ext)
        
    }, "203c576b7cbf_3236.raw")
}

