#' Count number of missing values for each row in a data frame.
#'
#' @param df A data frame.
#'
#' @return A vector of the count of missing values for each column. The vector is named if the data frame has row names.
#' @export
#'
#' @examples count_row_missing_values(mtcars)
count_row_missing_values <- function(df){
  df[["count_row_missing"]] <- rowSums(is.na(df))
}
