context("Check column existence")
library(glider)

test_that("check_column_existence recognizes missing columns", {
  df <- data.frame(a = c(1, 2), b = c(3, 4), c = c(5, 6))

  expect_output(check_column_existence(df, "d"), "d is not a column in df ")
  expect_setequal(check_column_existence(df, "d"), FALSE)
})
