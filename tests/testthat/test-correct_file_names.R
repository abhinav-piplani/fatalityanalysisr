test_that("Correct filenames are rendered", {
  expect_that(make_filename(2001), equals("accident_2001.csv.bz2"))
  expect_that(make_filename(2005), equals("accident_2005.csv.bz2"))
})
