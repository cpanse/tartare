#R


#' @importFrom utils packageVersion
.onAttach <- function(lib, pkg) {
    if (interactive()) {
        version <- packageVersion('tartare')
        packageStartupMessage("Package 'tartare' version ", version)
        
        invisible()
    }
}


