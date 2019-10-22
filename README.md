# tartare

raw file collection recorded on Thermo Fisher Scientific mass spectrometers for
extented unit testing


## install 

```
# Release (3.10) 
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("tartare", version="devel")
```

see also https://bioconductor.org/packages/tartare/

## requires

the following usage example requires the following packages:

1. https://github.com/rformassspectrometry/Spectra
2. https://github.com/cpanse/MsBackendRawFileReader


![schema](https://user-images.githubusercontent.com/4901987/67311128-4a2fdf80-f4ff-11e9-8db2-49340d69f563.jpg)
by courtesy of [@jorainer](https://github.com/jorainer)


## usage

taken from the help pages `?tartare`.

```
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

hfx.filename <- .query(eh,
    c('tartar', '20190710_003_PierceHeLaProteinDigestStd.raw'))
x <- .cnew ("Rawfile", hfx.filename)
x$GetInfoValues()

## End(Not run)

```
