#' Count number of missing values for each row in a data frame.
#'
#' @param df A data frame.
#'
#' @return A vector of the count of missing values for each column. The vector is named if the data frame has row names.
#'
#' @examples count_row_missing_values(mtcars)
count_row_missing_values <- function(df){
  rowSums(is.na(df))
}
