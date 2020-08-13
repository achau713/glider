context("Count total missing values")
library(glider)

test_that("count_total_missing_values counts correct number of total missing values", {
  df <- data.frame(a = c(1, NA, 2), b = c(NA, 2, NA), c = c(1, 2, NA))

  count_missing_values <- 4

  expect_setequal(count_total_missing_values(df), count_missing_values)
})
