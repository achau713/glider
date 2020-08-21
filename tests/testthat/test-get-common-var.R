context("Get common variables among multiple data frames")
library(glider)

test_that("get_common_var returns common variables", {
  df1 <- data.frame(a = 1, b = 2, c = 3)
  df2 <- data.frame(a = 1, A = 2, b = 2)
  df3 <- data.frame(b = 3, C = 2, A = 3)

  expect_setequal(get_common_var(list(df1, df2, df3)), c("b"))
})


test_that("get_common_var returns message if no common key found", {
  df1 <- data.frame(a = 1, b = 2, c = 3)
  df2 <- data.frame(C = 1, A = 2, B = 2)

  expect_output(get_common_var(list(df1, df2)), "Unable to locate common variables")
})

test_that("get_common_var returns error if only 1 data frame is supplied as input", {
  df1 <- data.frame(a = 1, b = 2, c = 3)

  expect_error(get_common_var(df1), "Only 1 data frame supplied: supply more than 1 data frame")
  expect_error(get_common_var(list(df1)), "Only 1 data frame supplied: supply more than 1 data frame")
})
