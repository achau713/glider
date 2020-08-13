
#' Count NA values with row-wise, column-wise, and overall scope.
#'
#' Check out \code{\link{count_total_missing_values}},
#' \code{\link{count_row_missing_values}}, and
#' \code{\link{count_column_missing_values}}
#'
#' @param df A data frame
#' @param cols A character vector of column names. Defaults to all columns
#'
#' @return A named list of missing values for each view (total, column-wise, row-wise).
#' @export
#'
#' @examples
#' count_missing_values(mtcars)
count_missing_values <- function(df, cols = colnames(df)){

  # Count missing values: total, column-wise, row-wise
  na_total_count <- count_total_missing_values(df[, cols])
  na_colwise_count <- count_column_missing_values(df[, cols])
  na_rowwise_count <- count_row_missing_values(df[, cols])


  return(
    list(na_total = na_total_count,
         na_colwise = na_colwise_count,
         na_rowwise = na_rowwise_count)
    )

}
