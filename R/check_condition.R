#' Return values after applying a condition
#'
#' @param df A data frame
#' @param x Character name of column
#' @param condition An anonymous function expressing a condition
#'
#' @return A vector of boolean values
#' @export
#'
#' @examples check_condition(cesd, "b1_row_missing", function(x) x == 1)
check_condition <- function(df, x, condition){
  condition_col <- as.vector(df[,x])
  return(condition(condition_col))
}


