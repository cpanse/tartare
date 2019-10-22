test_that("md5", {


	eh.md5 = vapply(files, function(f){paste("md5", md5sum(f), sep='=')},
		FUN.VALUE = "md=544cdee961107b3e6f755b5401d20b407") 


	expect_equal(length(eh.md5), 4)

	expect_equal(sum(eh.md5 %in% metadata$Notes), 4)
	expect_equal((sum(metadata$Notes %in% eh.md5), 4)

})

