# tartare

raw file collection recorded on Thermo Fisher Scientific mass spectrometers for
extented unit testing

https://github.com/Bioconductor/Contributions/issues/1286

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


![schema](https://raw.githubusercontent.com/jorainer/swemsa_2019/master/images/Spectra-backends-02.png)
Courtesy of [@jorainer](https://github.com/jorainer); SWEMSA 2019 conference in Erding, Germany [10.5281/zenodo.3499649](https://doi.org/10.5281/zenodo.3499649).




## usage

taken from the help pages `?tartare`.

```
library(tartare)
library(ExperimentHub)

eh <- ExperimentHub()
(files <- getFilename(eh))

library(MsBackendRawFileReader)

be <- lapply(files, function(f){
if (grepl("mzXML$", f))
    backendInitialize(MsBackendMzR(), files = f)
else
    backendInitialize(MsBackendRawFileReader(), files = f, extra=FALSE)
})

be
```

```
R> be
$EH3219
MsBackendMzR with 1764 spectra
       msLevel     rtime scanIndex
     <integer> <numeric> <integer>
1            1  0.215344         1
2            1  0.713714         2
3            1   1.10822         3
4            1   1.50284         4
5            1   1.89709         5
...        ...       ...       ...
1760         2   239.767      1760
1761         2   239.834      1761
1762         2   239.901      1762
1763         2   239.969      1763
1764         2   240.036      1764
 ... 31 more variables/columns.

file(s):
203c4d41aa69_3235

$EH3220

filename:	/Users/cp/Library/Caches/ExperimentHub/203c576b7cbf_3236.raw
creation date:	7/11/2019 11:04:01 AM
first scan:	1
last scan:	1877
model:	Q Exactive HF-X Orbitrap
name:	Q Exactive HF-X Orbitrap
SerialNumber:	Exactive Series slot #6114 


$EH3221
MsBackendMzR with 8742 spectra
       msLevel     rtime scanIndex
     <integer> <numeric> <integer>
1            1 0.0653085         1
2            1  0.392698         2
3            1  0.720055         3
4            1   1.04732         4
5            1   1.37468         5
...        ...       ...       ...
8738         1   2099.13      8738
8739         1   2099.44      8739
8740         1   2099.76      8740
8741         1   2100.07      8741
8742         1   2100.38      8742
 ... 31 more variables/columns.

file(s):
203c51cb0c6f_3237

$EH3222

filename:	/Users/cp/Library/Caches/ExperimentHub/24ab678291f6_3238.raw
creation date:	7/16/2019 5:56:24 PM
first scan:	1
last scan:	8742
model:	Orbitrap Fusion Lumos
name:	Orbitrap Fusion Lumos
SerialNumber:	FSN20583 


R> 
```

```
hfx.filename <- getFilename(eh, c('tartar', '20190710_003_PierceHeLaProteinDigestStd.raw'));
x <- .cnew ("Rawfile", hfx.filename);
x$GetInfoValues()
```

```
see ?tartare and browseVignettes('tartare') for documentation
downloading 0 resources
loading from cache
[1] "/Users/cp/Library/Caches/ExperimentHub/203c576b7cbf_3236.raw"
[2] "7/11/2019 11:04:01 AM"                                       
[3] "1"                                                           
[4] "1877"                                                        
[5] "Q Exactive HF-X Orbitrap"                                    
[6] "Q Exactive HF-X Orbitrap"                                    
[7] "Exactive Series slot #6114"       
```

