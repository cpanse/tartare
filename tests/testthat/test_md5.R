test_that("md5", {
    eh <- ExperimentHub()
    eh.files <- tartare::getFilename(eh)
    
    
    (fl <- system.file("extdata", "metadata.csv", package='tartare'))
    metadata <- read.csv(fl, stringsAsFactors=FALSE)
    
	eh.md5 = vapply(eh.files, function(f){
	        paste("md5", tools::md5sum(f), sep='=')
	    },
		FUN.VALUE = "md5=544cdee961107b3e6f755b5401d20b407") 


	expect_equal(length(eh.md5), 4)

	expect_equal(sum(eh.md5 %in% metadata$Notes), 4)
	expect_equal(sum(metadata$Notes %in% eh.md5), 4)

})

