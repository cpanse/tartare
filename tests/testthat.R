library("testthat")
library("tools")
library("tartare")
library("ExperimentHub")

eh <- ExperimentHub()
(eh.files <- getFilename(eh))


(fl <- system.file("extdata", "metadata.csv", package='tartare'))
metadata <- read.csv(fl, stringsAsFactors=FALSE)

test_check("md5sum")
