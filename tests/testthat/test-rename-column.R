context("Rename column")
library(glider)

test_that("rename_column renames columns", {
  df <- data.frame(a = c(1, 2), b = c(3, 4), c = c(5, 6))

  expect_setequal(rename_column(df, "a", "new_col")[["new_col"]], c(1, 2))
  expect_named(rename_column(df, "a", "new_col"), c("new_col", "b", "c"), ignore.order = TRUE)
})
