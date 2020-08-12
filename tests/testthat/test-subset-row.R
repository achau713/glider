context("Subset rows")
library(glider)

test_that("subset_row works with a specified regex", {
  sample_data <- data.frame(state_name = c("Alabama", "arkansas", "california", "rhode island", "Alaska"),
                            ranking = c(14, 56, 12, 32, 43))

  states_start_with_a <- c("Alabama", "Alaska")

  expect_setequal(subset_row(df = sample_data, pattern = "^A", x = "state_name")[["state_name"]], states_start_with_a)
})
