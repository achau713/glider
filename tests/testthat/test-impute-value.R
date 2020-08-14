context("Impute values")
library(glider)


test_that("impute_values works with a factor column", {

  expect_true("hello" %in% impute_value(iris, impute_col = "Species", condition = iris$Species == 'setosa', replacement = "hello")[["Species"]])
})
