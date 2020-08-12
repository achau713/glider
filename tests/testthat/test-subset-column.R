context("Subset columns")
library(glider)

test_that("subset_column works with a specified regex", {
  sample_data <- data.frame(subject_id = c(1:5),
                            bp_1m = rnorm(5, mean = 100, sd = 20),
                            bp_3m = rnorm(5, mean = 100, sd = 20),
                            bp_6m = rnorm(5, mean = 100, sd = 20),
                            weight_1m = rnorm(5, mean = 180, sd = 10),
                            height_3m = rnorm(5, mean = 80, sd = 5),
                            weight_6m = rnorm(5, mean = 180, sd = 10))

  bp_columns <- c("bp_1m", "bp_3m", "bp_6m")

  expect_setequal(colnames(subset_column(df = sample_data, pattern = "^bp")), bp_columns)
})
