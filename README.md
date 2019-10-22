# tartare
raw file collection recorded on Thermo Fisher Scientific mass spectrometers for extented unit testing


## requires

the following usage example requires the following packages:

1. https://github.com/rformassspectrometry/Spectra
2. https://github.com/cpanse/MsBackendRawFileReader

## usage

taken from the help pages `?tartare`.

```
library(MsBackendRawFileReader)
library(tartare)

library(ExperimentHub)
eh <- ExperimentHub()
(files <- getFilename(eh))

## Not run: 
library(MsBackendRawFileReader)

be <- lapply(files, function(f){
if (grepl("mzXML$", f))
    backendInitialize(MsBackendMzR(), files = f)
else
    backendInitialize(MsBackendRawFileReader(), files = f, extra=FALSE)
})

be
## End(Not run)

## Not run: 

hfx.filename <- .query(eh, c('tartar', '20190710_003_PierceHeLaProteinDigestStd.raw'))
x <- .cnew ("Rawfile", hfx.filename)
x$GetInfoValues()

## End(Not run)

```
