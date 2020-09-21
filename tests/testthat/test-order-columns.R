context("Order columns")
library(glider)

test_that("order_columns orders columns", {
  df <- data.frame(a = c(1, 2), z = c(3, 4), l = c(5, 6), id = c(1000, 1001))

  expect_setequal(order_columns(df, "id")$id, c(1000, 1001))
})
