#' Count number of missing values for each row in a data frame.
#'
#' @param df A data frame.
#'
#' @return A data frame with new column containing the count of missing values for each column. The new column
#' is called count_row_missing
#' @export
#'
#' @examples count_row_missing_values(mtcars)
count_row_missing_values <- function(df){
  df[["count_row_missing"]] <- rowSums(is.na(df))
  return(df)
}
