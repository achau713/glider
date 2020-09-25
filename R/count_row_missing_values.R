#' Count number of missing values for each row in a data frame.
#'
#' @param df A data frame.
#' @param pattern A regex string to subset columns.
#' @param col_name Column name of the number of missing values for each row
#'
#' @return A data frame with new column containing the count of missing values for each column. By default, the new column
#' is called count_row_missing
#' @export
#'
#' @examples count_row_missing_values(mtcars)
count_row_missing_values <- function(df, pattern, col_name = "count_row_missing"){
  if (hasArg(pattern)){
    subset_df <- subset_column(df, pattern = pattern)
    df[[col_name]] <- rowSums(is.na(subset_df))
  } else{
    df[[col_name]] <- rowSums(is.na(df))
  }
  return(df)
}

