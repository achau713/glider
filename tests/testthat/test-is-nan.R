context("Check for NaNs in a data frame")
library(glider)

test_that("is_nan returns a data frame of logicals", {
  df <- data.frame(a = c(NaN, 1, 2), b = c(1, 2, NaN))

  a_logical <- c(TRUE, FALSE, TRUE)
  b_logical <- c(FALSE, FALSE, TRUE)

  expect_setequal(is_nan(df)[, "a"], a_logical)
  expect_setequal(is_nan(df)[, "b"], b_logical)
})

test_that("is_nan returns logicals to correctly replace with NA", {
  df <- data.frame(a = c(NaN, 1, 2), b = c(1, 2, NaN))

  a_with_NA <- c(NA, 1, 2)
  b_with_NA <- c(1, 2, NA)

  df[is_nan(df)] <- NA

  expect_setequal(df[["a"]], a_with_NA)
  expect_setequal(df[["b"]], b_with_NA)
})

