context("Count missing values")
library(glider)

test_that("count_total_missing_values works when only 1 column is specified", {
  df <- data.frame(a = c(1, NA, 2), b = c(NA, 2, NA), c = c(1, 2, NA))

  count_total_missing <- 1
  count_col_missing <- 1
  count_row_missing <- c(0, 1, 0)

  expect_setequal(count_missing_values(df, cols = c("a"))$na_total, count_total_missing)
  expect_setequal(count_missing_values(df, cols = c("a"))$na_colwise, count_col_missing)
  expect_setequal(count_missing_values(df, cols = c("a"))$na_rowwise, count_row_missing)
})
