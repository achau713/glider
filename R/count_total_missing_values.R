#' Count total number of missing values in a data frame.
#'
#' @param df A data frame.
#'
#' @return Count of missing values in the data frame
#'
#' @examples count_total_missing_values(mtcars)
count_total_missing_values <- function(df){
  sum(is.na(df))
}
