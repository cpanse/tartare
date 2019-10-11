# tartare
raw file collection recorded on Thermo Fisher Scientific mass spectrometers for extented unit testing


## requires

the following usage example requires the following packages:

1. https://github.com:rformassspectrometry/Spectra
2. https://github.com/cpanse/MsBackendRawFileReader

## usage

```
R> library(MsBackendRawFileReader)
R> library(tartare)

R> lumos.filename <- file.path(path.expand("~"),
                            "tartare_data/20190710_003_PierceHeLaProteinDigestStd.raw")

R> hfx.filename <- file.path(path.expand("~"),
                          "tartare_data/20190716_004_PierceHeLa.raw")


R> be <- backendInitialize(MsBackendRawFileReader(), files = c(hfx.filename,lumos.filename), extra=FALSE)
R> S <- Spectra(be)


R> S
MSn data (Spectra) with 10619 spectra in a MsBackendRawFileReader backend:
filename:	/Users/cp/tartare_data/20190716_004_PierceHeLa.raw
creation date:	7/16/2019 5:56:24 PM
first scan:	1
last scan:	8742
model:	Orbitrap Fusion Lumos 

filename:	/Users/cp/tartare_data/20190710_003_PierceHeLaProteinDigestStd.raw
creation date:	7/11/2019 11:04:01 AM
first scan:	1
last scan:	1877
model:	Q Exactive HF-X Orbitrap 

Processing:
  
R> 
```
