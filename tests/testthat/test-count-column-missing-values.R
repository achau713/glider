context("Count missing values in each column")
library(glider)

test_that("count_column_missing_values counts correct number of missing values for each column", {
  df <- data.frame(a = c(1, NA, 2), b = c(NA, 2, NA), c = c(1, 2, NA))

  missing_values <- c(1, 2, 1)

  expect_setequal(count_column_missing_values(df), missing_values)
})
