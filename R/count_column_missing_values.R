#' Count number of missing values for each column in a data frame.
#'
#' @param df A data frame.
#'
#' @return A named vector of the count of missing values for each column.
#'
#' @examples count_column_missing_values(mtcars)
count_column_missing_values <- function(df){
  colSums(is.na(df))
}
