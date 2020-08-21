#' Check if columns exist in a data frame
#'
#' @param df A data frame
#' @param col_names A vector of column names
#'
#' @return Boolean indicating if all specified column names exist in the data frame.
#' Otherwise, a message ascertaining non-existence of columns is displayed
#' @export
#'
#' @examples
#' check_column_existence(mtcars, c("mpg", "disp"))
check_column_existence <- function(df, col_names){

  # save data frame name as label
  df_name <- deparse(substitute(df))

  # logical vector indicating if column name exists in the data frame
  col_exists <- col_names %in% colnames(df)

  # display which column names do not exist in the data frame
  if(!all(col_exists)){
    cat(paste(col_names[!col_exists], "is not a column in", df_name, "\n"))
  }

  return(invisible(all(col_exists)))
}
